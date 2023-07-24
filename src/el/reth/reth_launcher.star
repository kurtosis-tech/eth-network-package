shared_utils = import_module("github.com/kurtosis-tech/eth-network-package/shared_utils/shared_utils.star")
input_parser = import_module("github.com/kurtosis-tech/eth-network-package/package_io/input_parser.star")
el_client_context = import_module("github.com/kurtosis-tech/eth-network-package/src/el/el_client_context.star")
el_admin_node_info = import_module("github.com/kurtosis-tech/eth-network-package/src/el/el_admin_node_info.star")

package_io = import_module("github.com/kurtosis-tech/eth-network-package/package_io/constants.star")


RPC_PORT_NUM		= 8545
WS_PORT_NUM			= 8546
DISCOVERY_PORT_NUM	= 30303
ENGINE_RPC_PORT_NUM = 8551
METRICS_PORT_NUM = 9001

# Port IDs
RPC_PORT_ID			= "rpc"
WS_PORT_ID			= "ws"
TCP_DISCOVERY_PORT_ID = "tcp-discovery"
UDP_DISCOVERY_PORT_ID = "udp-discovery"
ENGINE_RPC_PORT_ID	= "engine-rpc"
METRICS_PORT_ID = "metrics"

GENESIS_DATA_MOUNT_DIRPATH = "/genesis"

PREFUNDED_KEYS_MOUNT_DIRPATH = "/prefunded-keys"

# The dirpath of the execution data directory on the client container
EXECUTION_DATA_DIRPATH_ON_CLIENT_CONTAINER = "/execution-data"

PRIVATE_IP_ADDRESS_PLACEHOLDER = "KURTOSIS_IP_ADDR_PLACEHOLDER"

USED_PORTS = {
	RPC_PORT_ID: shared_utils.new_port_spec(RPC_PORT_NUM, shared_utils.TCP_PROTOCOL),
	WS_PORT_ID: shared_utils.new_port_spec(WS_PORT_NUM, shared_utils.TCP_PROTOCOL),
	TCP_DISCOVERY_PORT_ID: shared_utils.new_port_spec(DISCOVERY_PORT_NUM, shared_utils.TCP_PROTOCOL),
	UDP_DISCOVERY_PORT_ID: shared_utils.new_port_spec(DISCOVERY_PORT_NUM, shared_utils.UDP_PROTOCOL),
	ENGINE_RPC_PORT_ID: shared_utils.new_port_spec(ENGINE_RPC_PORT_NUM, shared_utils.TCP_PROTOCOL),
    METRICS_PORT_ID: shared_utils.new_port_spec(METRICS_PORT_NUM, shared_utils.TCP_PROTOCOL)
}

ENTRYPOINT_ARGS = ["sh", "-c"]

VERBOSITY_LEVELS = {
	package_io.GLOBAL_CLIENT_LOG_LEVEL.error: "v",
	package_io.GLOBAL_CLIENT_LOG_LEVEL.warn:  "vv",
	package_io.GLOBAL_CLIENT_LOG_LEVEL.info:  "vvv",
	package_io.GLOBAL_CLIENT_LOG_LEVEL.debug: "vvvv",
	package_io.GLOBAL_CLIENT_LOG_LEVEL.trace: "vvvvv",
}


def launch(
	plan,
	launcher,
	service_name,
	image,
	participant_log_level,
	global_log_level,
	# If empty then the node will be launched as a bootnode
	existing_el_clients,
	extra_params):


	log_level = input_parser.get_client_log_level_or_default(participant_log_level, global_log_level, VERBOSITY_LEVELS)

	config, jwt_secret_json_filepath_on_client = get_config(launcher.network_id, launcher.el_genesis_data, launcher.prefunded_eth_keys_artifact_uuid,
									launcher.prefunded_account_info, image, existing_el_clients, log_level, extra_params)

	service = plan.add_service(service_name, config)

	enode = el_admin_node_info.get_enode_for_node(plan, service_name, RPC_PORT_ID)

	jwt_secret = shared_utils.read_file_from_service(plan, service_name, jwt_secret_json_filepath_on_client)

	return el_client_context.new_el_client_context(
		"reth",
		"", # reth has no enr
		enode,
		service.ip_address,
		RPC_PORT_NUM,
		WS_PORT_NUM,
		ENGINE_RPC_PORT_NUM,
		jwt_secret,
		service_name,
	)

def get_config(network_id, genesis_data, prefunded_eth_keys_artifact_uuid, prefunded_account_info, image, existing_el_clients, verbosity_level, extra_params):

	genesis_json_filepath_on_client = shared_utils.path_join(GENESIS_DATA_MOUNT_DIRPATH, genesis_data.geth_genesis_json_relative_filepath)
	jwt_secret_json_filepath_on_client = shared_utils.path_join(GENESIS_DATA_MOUNT_DIRPATH, genesis_data.jwt_secret_relative_filepath)

	account_addresses_to_unlock = []
	for prefunded_account in prefunded_account_info:
		account_addresses_to_unlock.append(prefunded_account.address)


	accounts_to_unlock_str = ",".join(account_addresses_to_unlock)

	init_datadir_cmd_str = "reth init --datadir={0}".format(
		EXECUTION_DATA_DIRPATH_ON_CLIENT_CONTAINER,
	)

	launch_node_cmd = [
		"reth",
        "node",
		"-{0}".format(verbosity_level),
		"--datadir=" + EXECUTION_DATA_DIRPATH_ON_CLIENT_CONTAINER,
		"--http",
        "--http.port={0}".format(RPC_PORT_NUM),
		"--http.addr=0.0.0.0",
		"--http.corsdomain=*",
		# WARNING: The admin info endpoint is enabled so that we can easily get ENR/enode, which means
		#  that users should NOT store private information in these Kurtosis nodes!
		"--http.api=admin,net,eth",
		"--ws",
		"--ws.addr=0.0.0.0",
		"--ws.port={0}".format(WS_PORT_NUM),
		"--ws.api=net,eth",
		"--ws.origins=*",
		"--nat=extip:" + PRIVATE_IP_ADDRESS_PLACEHOLDER,
		"--authrpc.port={0}".format(ENGINE_RPC_PORT_NUM),
        "--authrpc.jwtsecret={0}".format(jwt_secret_json_filepath_on_client),
		"--authrpc.addr=0.0.0.0",
        "--metrics=0.0.0.0:{0}".format(METRICS_PORT_NUM)
	]

	bootnode_enode = ""
	if len(existing_el_clients) > 0:
		bootnode_context = existing_el_clients[0]
		bootnode_enode = bootnode_context.enode

	launch_node_cmd.append(
		'--bootnodes="{0}"'.format(bootnode_enode),
	)

	if len(extra_params) > 0:
		# this is a repeated<proto type>, we convert it into Starlark
		launch_node_cmd.extend([param for param in extra_params])


	launch_node_cmd_str = " ".join(launch_node_cmd)

	subcommand_strs = [
		init_datadir_cmd_str,
		launch_node_cmd_str,
	]
	command_str = " && ".join(subcommand_strs)

	return ServiceConfig(
		image = image,
		ports = USED_PORTS,
		cmd = [command_str],
		files = {
			GENESIS_DATA_MOUNT_DIRPATH: genesis_data.files_artifact_uuid,
			PREFUNDED_KEYS_MOUNT_DIRPATH: prefunded_eth_keys_artifact_uuid
		},
		entrypoint = ENTRYPOINT_ARGS,
		private_ip_address_placeholder = PRIVATE_IP_ADDRESS_PLACEHOLDER
	), jwt_secret_json_filepath_on_client


def new_reth_launcher(network_id, el_genesis_data, prefunded_eth_keys_artifact_uuid, prefunded_account_info):
	return struct(
		network_id = network_id,
		el_genesis_data = el_genesis_data,
		prefunded_account_info = prefunded_account_info,
		prefunded_eth_keys_artifact_uuid = prefunded_eth_keys_artifact_uuid,
	)
