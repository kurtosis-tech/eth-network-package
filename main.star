participant_network = import_module("github.com/barnabasbusa/eth-network-package/src/participant_network.star")
input_parser = import_module("github.com/barnabasbusa/eth-network-package/package_io/input_parser.star")

static_files = import_module("github.com/barnabasbusa/eth-network-package/static_files/static_files.star")
genesis_constants = import_module("github.com/barnabasbusa/eth-network-package/src/prelaunch_data_generator/genesis_constants/genesis_constants.star")

def run(plan, args):
    args_with_right_defaults = input_parser.parse_input(args)

    num_participants = len(args_with_right_defaults.participants)
    network_params = args_with_right_defaults.network_params

    plan.print("Launching participant network with {0} participants and the following network params {1}".format(num_participants, network_params))
    all_participants, cl_genesis_timestamp = participant_network.launch_participant_network(plan, args_with_right_defaults.participants, network_params, args_with_right_defaults.global_client_log_level)

    plan.print("NODE JSON RPC URI: '{0}:{1}'".format(all_participants[0].el_client_context.ip_addr, all_participants[0].el_client_context.rpc_port_num))
    return all_participants, cl_genesis_timestamp
