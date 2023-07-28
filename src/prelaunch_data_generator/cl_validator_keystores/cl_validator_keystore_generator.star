prelaunch_data_generator_launcher = import_module("github.com/kurtosis-tech/eth-network-package/src/prelaunch_data_generator/prelaunch_data_generator_launcher/prelaunch_data_generator_launcher.star")

shared_utils = import_module("github.com/kurtosis-tech/eth-network-package/shared_utils/shared_utils.star")
static_files = import_module("github.com/kurtosis-tech/eth-network-package/static_files/static_files.star")
keystore_files_module = import_module("github.com/kurtosis-tech/eth-network-package/src/prelaunch_data_generator/cl_validator_keystores/keystore_files.star")
keystores_result = import_module("github.com/kurtosis-tech/eth-network-package/src/prelaunch_data_generator/cl_validator_keystores/generate_keystores_result.star")


NODE_KEYSTORES_OUTPUT_DIRPATH_FORMAT_STR = "/node-{0}-keystores"

# Prysm keystores are encrypted with a password
PRYSM_PASSWORD							= "password"
PRYSM_PASSWORD_FILEPATH_ON_GENERATOR 	= "/tmp/prysm-password.txt"

KEYSTORES_GENERATION_TOOL_NAME = "eth2-val-tools"

SUCCESSFUL_EXEC_CMD_EXIT_CODE = 0

RAW_KEYS_DIRNAME	= "keys"
RAW_SECRETS_DIRNAME = "secrets"

NIMBUS_KEYS_DIRNAME = "nimbus-keys"
PRYSM_DIRNAME		= "prysm"

TEKU_KEYS_DIRNAME	= "teku-keys"
TEKU_SECRETS_DIRNAME = "teku-secrets"


# Generates keystores for the given number of nodes from the given mnemonic, where each keystore contains approximately
#
#	num_keys / num_nodes keys
def generate_cl_validator_keystores(
	plan,
	mnemonic,
	participants,
	num_validators_per_node):

	keystore_generator = plan.upload_files(static_files.KEYSTORE_MULTI_THREADED_GENERATOR)

	service_name = prelaunch_data_generator_launcher.launch_prelaunch_data_generator(
		plan,
		{
			"/tmp/": keystore_generator
		},
		"cl-validator-keystore",
	)

	all_output_dirpaths = []

	for idx, participant in enumerate(participants):
		output_dirpath = NODE_KEYSTORES_OUTPUT_DIRPATH_FORMAT_STR.format(idx)
		all_output_dirpaths.append(output_dirpath)

	keystore_geneation_command = "python3 /tmp/keystore_generator.py {0} {1} {2} \"{3}\"".format(
		num_validators_per_node,
		len(participants),
		PRYSM_PASSWORD,
		mnemonic,
	)

	command_result = plan.exec(recipe = ExecRecipe(command=["sh", "-c", keystore_geneation_command]), service_name=service_name)
	plan.assert(command_result["code"], "==", SUCCESSFUL_EXEC_CMD_EXIT_CODE)

	# Store outputs into files artifacts
	keystore_files = []
	for idx, participant in enumerate(participants):
		output_dirpath = all_output_dirpaths[idx]

		padded_idx = zfill_custom(idx+1, len(str(len(participants))))
		keystore_start_index = idx * num_validators_per_node
		keystore_stop_index = (idx+1) * num_validators_per_node - 1
		artifact_name = "{0}-{1}-{2}-{3}-{4}".format(
			padded_idx,
			participant.cl_client_type,
			participant.el_client_type,
			keystore_start_index,
			keystore_stop_index,
		)
		artifact_name = plan.store_service_files(service_name, output_dirpath, name=artifact_name)

		# This is necessary because the way Kurtosis currently implements artifact-storing is
		base_dirname_in_artifact = shared_utils.path_base(output_dirpath)
		to_add = keystore_files_module.new_keystore_files(
			artifact_name,
			shared_utils.path_join(base_dirname_in_artifact, RAW_KEYS_DIRNAME),
			shared_utils.path_join(base_dirname_in_artifact, RAW_SECRETS_DIRNAME),
			shared_utils.path_join(base_dirname_in_artifact, NIMBUS_KEYS_DIRNAME),
			shared_utils.path_join(base_dirname_in_artifact, PRYSM_DIRNAME),
			shared_utils.path_join(base_dirname_in_artifact, TEKU_KEYS_DIRNAME),
			shared_utils.path_join(base_dirname_in_artifact, TEKU_SECRETS_DIRNAME),
		)

		keystore_files.append(to_add)


	write_prysm_password_file_cmd = [
		"sh",
		"-c",
		"echo '{0}' > {1}".format(
			PRYSM_PASSWORD,
			PRYSM_PASSWORD_FILEPATH_ON_GENERATOR,
		),
	]
	write_prysm_password_file_cmd_result = plan.exec(recipe = ExecRecipe(command=write_prysm_password_file_cmd), service_name=service_name)
	plan.assert(write_prysm_password_file_cmd_result["code"], "==", SUCCESSFUL_EXEC_CMD_EXIT_CODE)

	prysm_password_artifact_name = plan.store_service_files(service_name, PRYSM_PASSWORD_FILEPATH_ON_GENERATOR, name = "prysm-password")

	result = keystores_result.new_generate_keystores_result(
		prysm_password_artifact_name,
		shared_utils.path_base(PRYSM_PASSWORD_FILEPATH_ON_GENERATOR),
		keystore_files,
	)

	# we cleanup as the data generation is done
	# plan.remove_service(service_name)
	return result

def zfill_custom(value, width):
    return ("0" * (width - len(str(value)))) + str(value)
