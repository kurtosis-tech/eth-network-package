DEFAULT_EL_IMAGES = {
	"geth":			"ethereum/client-go:latest",
	"erigon":		"thorax/erigon:devel",
	"nethermind":	"nethermind/nethermind:latest",
	"besu":			"hyperledger/besu:develop"
}

DEFAULT_CL_IMAGES = {
	"lighthouse":	"sigp/lighthouse:latest",
	"teku":			"consensys/teku:latest",
	"nimbus":		"statusim/nimbus-eth2:multiarch-latest",
	"prysm":		"prysmaticlabs/prysm-beacon-chain:latest,prysmaticlabs/prysm-validator:latest",
	"lodestar":		"chainsafe/lodestar:latest",
}

BESU_NODE_NAME = "besu"
NETHERMIND_NODE_NAME = "nethermind"
NIMBUS_NODE_NAME = "nimbus"

ATTR_TO_BE_SKIPPED_AT_ROOT = ("network_params", "participants")

def parse_input(input_args):
	result = default_input_args()
	for attr in input_args:
		value = input_args[attr]
		# if its insterted we use the value inserted
		if attr not in ATTR_TO_BE_SKIPPED_AT_ROOT and attr in input_args:
			result[attr] = value
		elif attr == "network_params":
			for sub_attr in input_args["network_params"]:
				sub_value = input_args["network_params"][sub_attr]
				result["network_params"][sub_attr] = sub_value
		elif attr == "participants":
			participants = []
			for participant in input_args["participants"]:
				new_participant = default_participant()
				for sub_attr, sub_value in participant.items():
					# if the value is set in input we set it in participant
					new_participant[sub_attr] = sub_value
				for _ in range(0, new_participant["count"]):
					participants.append(new_participant)
			result["participants"] = participants

	# validation of the above defaults
	for index, participant in enumerate(result["participants"]):
		el_client_type = participant["el_client_type"]
		cl_client_type = participant["cl_client_type"]

		if index == 0 and el_client_type in (BESU_NODE_NAME, NETHERMIND_NODE_NAME):
			fail("besu/nethermind cant be the first participant")
		if cl_client_type in (NIMBUS_NODE_NAME) and (result["network_params"]["seconds_per_slot"] < 12):
			fail("nimbus can't be run with slot times below 12 seconds")
		el_image = participant["el_client_image"]
		if el_image == "":
			default_image = DEFAULT_EL_IMAGES.get(el_client_type, "")
			if default_image == "":
				fail("{0} received an empty image name and we don't have a default for it".format(el_client_type))
			participant["el_client_image"] = default_image

		cl_image = participant["cl_client_image"]
		if cl_image == "":
			default_image = DEFAULT_CL_IMAGES.get(cl_client_type, "")
			if default_image == "":
				fail("{0} received an empty image name and we don't have a default for it".format(cl_client_type))
			participant["cl_client_image"] = default_image

		beacon_extra_params = participant.get("beacon_extra_params", [])
		participant["beacon_extra_params"] = beacon_extra_params

		validator_extra_params = participant.get("validator_extra_params", [])
		participant["validator_extra_params"] = validator_extra_params

	if result["network_params"]["network_id"].strip() == "":
		fail("network_id is empty or spaces it needs to be of non zero length")

	if result["network_params"]["deposit_contract_address"].strip() == "":
		fail("deposit_contract_address is empty or spaces it needs to be of non zero length")

	if result["network_params"]["preregistered_validator_keys_mnemonic"].strip() == "":
		fail("preregistered_validator_keys_mnemonic is empty or spaces it needs to be of non zero length")

	if result["network_params"]["slots_per_epoch"] == 0:
		fail("slots_per_epoch is 0 needs to be > 0 ")

	if result["network_params"]["seconds_per_slot"] == 0:
		fail("seconds_per_slot is 0 needs to be > 0 ")

	if result["network_params"]["genesis_delay"] == 0:
		fail("genesis_delay is 0 needs to be > 0 ")

	if result["network_params"]["capella_fork_epoch"] == 0:
		fail("capella_fork_epoch is 0 needs to be > 0 ")

	if result["network_params"]["deneb_fork_epoch"] == 0:
		fail("deneb_fork_epoch is 0 needs to be > 0 ")

	required_num_validtors = 2 * result["network_params"]["slots_per_epoch"]
	actual_num_validators = len(result["participants"]) * result["network_params"]["num_validator_keys_per_node"]
	if required_num_validtors > actual_num_validators:
		fail("required_num_validtors - {0} is greater than actual_num_validators - {1}".format(required_num_validtors, actual_num_validators))

	# Remove if nethermind doesn't break as second node we already test above if its the first node
	if len(result["participants"]) >= 2 and result["participants"][1]["el_client_type"] == NETHERMIND_NODE_NAME:
		fail("nethermind can't be the first or second node")

	return struct(
		participants=[struct(
			el_client_type=participant["el_client_type"],
			el_client_image=participant["el_client_image"],
			el_client_log_level=participant["el_client_log_level"],
			cl_client_type=participant["cl_client_type"],
			cl_client_image=participant["cl_client_image"],
			cl_client_log_level=participant["cl_client_log_level"],
			beacon_extra_params=participant["beacon_extra_params"],
			el_extra_params=participant["el_extra_params"],
			validator_extra_params=participant["validator_extra_params"],
			builder_network_params=participant["builder_network_params"],
			el_min_cpu=participant["el_min_cpu"],
			el_max_cpu=participant["el_max_cpu"],
			el_min_mem=participant["el_min_mem"],
			el_max_mem=participant["el_max_mem"],
			bn_min_cpu=participant["bn_min_cpu"],
			bn_max_cpu=participant["bn_max_cpu"],
			bn_min_mem=participant["bn_min_mem"],
			bn_max_mem=participant["bn_max_mem"],
			v_min_cpu=participant["v_min_cpu"],
			v_max_cpu=participant["v_max_cpu"],
			v_min_mem=participant["v_min_mem"],
			v_max_mem=participant["v_max_mem"],
			count=participant["count"]
		) for participant in result["participants"]],
		network_params=struct(
			preregistered_validator_keys_mnemonic=result["network_params"]["preregistered_validator_keys_mnemonic"],
			num_validator_keys_per_node=result["network_params"]["num_validator_keys_per_node"],
			network_id=result["network_params"]["network_id"],
			deposit_contract_address=result["network_params"]["deposit_contract_address"],
			seconds_per_slot=result["network_params"]["seconds_per_slot"],
			slots_per_epoch=result["network_params"]["slots_per_epoch"],
			capella_fork_epoch=result["network_params"]["capella_fork_epoch"],
			deneb_fork_epoch=result["network_params"]["deneb_fork_epoch"],
			genesis_delay=result["network_params"]["genesis_delay"]
		),
		wait_for_finalization=result["wait_for_finalization"],
		wait_for_verifications=result["wait_for_verifications"],
		verifications_epoch_limit=result["verifications_epoch_limit"],
		global_client_log_level=result["global_client_log_level"]
	)

def get_client_log_level_or_default(participant_log_level, global_log_level, client_log_levels):
	log_level = participant_log_level
	if log_level == "":
		log_level = client_log_levels.get(global_log_level, "")
		if log_level == "":
			fail("No participant log level defined, and the client log level has no mapping for global log level '{0}'".format(global_log_level))
	return log_level

def default_input_args():
	network_params = default_network_params()
	participants = [default_participant()]
	return {
		"participants":					participants,
		"network_params":				network_params,
		"wait_for_finalization":		False,
		"wait_for_verifications":		False,
		"verifications_epoch_limit":	5,
		"global_client_log_level":		"info"
	}

def default_network_params():
	# this is temporary till we get params working
	return {
		"preregistered_validator_keys_mnemonic": "giant issue aisle success illegal bike spike question tent bar rely arctic volcano long crawl hungry vocal artwork sniff fantasy very lucky have athlete",
		"num_validator_keys_per_node":	64,
		"network_id":					"3151908",
		"deposit_contract_address":		"0x4242424242424242424242424242424242424242",
		"seconds_per_slot":				12,
		"slots_per_epoch":				32,
		"genesis_delay":				120,
		"capella_fork_epoch":			1,
		# arbitrarily large while we sort out https://github.com/kurtosis-tech/eth-network-package/issues/42
		# this will take 53~ hoours for now
		"deneb_fork_epoch":				500,
	}

def default_participant():
	return {
			"el_client_type":			"geth",
			"el_client_image":			"",
			"el_client_log_level":		"",
			"cl_client_type":			"lighthouse",
			"cl_client_image":			"",
			"cl_client_log_level":		"",
			"beacon_extra_params":		[],
			"el_extra_params":			[],
			"validator_extra_params": 	[],
			"builder_network_params": 	None,
			"el_min_cpu":				"",
			"el_max_cpu":				"",
			"el_min_mem":				"",
			"el_max_mem":				"",
			"bn_min_cpu":				"",
			"bn_max_cpu":				"",
			"bn_min_mem":				"",
			"bn_max_mem":				"",
			"v_min_cpu":				"",
			"v_max_cpu":				"",
			"v_min_mem":				"",
			"v_max_mem":				"",
			"count": 					1
	}
