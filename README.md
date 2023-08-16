# Ethereum Network Package

![Run of the Ethereum Network Package](/run.gif)

This is a Kurtosis Starlark Package that spins up an Ethereum network.

### Run

This assumes you have the [Kurtosis CLI](https://docs.kurtosis.com/cli/) installed and the [Docker daemon](https://docs.kurtosis.com/install#i-install--start-docker) running on your local machine.

To get started, simply run

```bash
kurtosis run github.com/kurtosis-tech/eth-network-package
```

### Configuring the Network

By default, this package spins up a single node with a [`geth`](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/el/geth/geth_launcher.star) EL client and [`lighthouse`](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/cl/lighthouse/lighthouse_launcher.star) CL client and comes with [seven prefunded keys](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/prelaunch_data_generator/genesis_constants/genesis_constants.star) for testing, but
these and other parameters are configurable through a json file Read more about the [node architecture here](https://ethereum.org/en/developers/docs/nodes-and-clients/node-architecture/). The package supports `geth`, `nethermind`, `besu`, `erigon`, `reth` el clients and `lodestar`, `lighthouse`, and `teku` cl clients.

<details>
    <summary>Click to show all configuration options</summary>

<!-- Yes, it's weird that none of this is indented but it's intentional - indenting anything inside this "details" expandable will cause it to render weird" -->

```json
{
  //  Specification of the participants in the network
  "participants": [
    {
      //  The type of EL client that should be started
      //  Valid values are "geth, besu, erigon, nethermind, and reth"
      "el_client_type": "geth",

      //  The Docker image that should be used for the EL client; leave blank to use the default for the client type
      //  Defaults by client:
      //  - geth: ethereum/client-go:latest
      //  - erigon: thorax/erigon:devel
      //  - nethermind:	nethermind/nethermind:latest
      //  - besu:	hyperledger/besu:develop
      //  - reth: h4ck3rk3y/reth (TODO: update when an official Reth image is published)
      "el_client_image": "",

      //  The log level string that this participant's EL client should log at
      //  If this is emptystring then the global `logLevel` parameter's value will be translated into a string appropriate for the client (e.g. if
      //   global `logLevel` = `info` then Geth would receive `3`)
      //  If this is not emptystring, then this value will override the global `logLevel` setting to allow for fine-grained control
      //   over a specific participant's logging
      "el_client_log_level": "",

      //  A list of optional extra params that will be passed to the EL client container for modifying its behaviour
      "el_extra_params": [],

      //  The type of CL client that should be started
      //  Valid values are "lighthouse", "nimbus", "lodestar", "teku", and "prysm"
      "cl_client_type": "lighthouse",

      //  The Docker image that should be used for the EL client; leave blank to use the default for the client type
      //  Defaults by client:
      //  - lighthouse: sigp/lighthouse:latest
      //  - teku: consensys/teku:latest
      //  - lodestar: chainsafe/lodestar:latest
      //  - nimbus: statusim/nimbus-eth2:multiarch-latest
      //  - prysm: prysmaticlabs/prysm-beacon-chain:latest,prysmaticlabs/prysm-validator:latest
      "cl_client_image": "",

      //  The log level string that this participant's EL client should log at
      //  If this is emptystring then the global `logLevel` parameter's value will be translated into a string appropriate for the client (e.g. if
      //   global `logLevel` = `info` then Teku would receive `INFO`, Prysm would receive `info`, etc.)
      //  If this is not emptystring, then this value will override the global `logLevel` setting to allow for fine-grained control
      //   over a specific participant's logging
      "cl_client_log_level": "",

      //  A list of optional extra params that will be passed to the CL client Beacon container for modifying its behaviour
      //  If the client combines the Beacon & validator nodes (e.g. Teku), then this list will be passed to the combined Beacon-validator node
      "beacon_extra_params": [],

      //  A list of optional extra params that will be passed to the CL client validator container for modifying its behaviour
      //  If the client combines the Beacon & validator nodes (e.g. Teku), then this list will also be passed to the combined Beacon-validator node
      "validator_extra_params": [],

      // A set of parameters the node needs to reach an external block building network
      // If `null` then the builder infrastructure will not be instantiated
      // Example:
      //
      // "relay_endpoints": [
      //   "https://0xdeadbeefcafa@relay.example.com",
      //   "https://0xdeadbeefcafb@relay.example.com",
      //   "https://0xdeadbeefcafc@relay.example.com",
      //   "https://0xdeadbeefcafd@relay.example.com"
      //  ]
      "builder_network_params": null,

      // Execution node minimum and maximum CPU (millicpu) and memory (MB) limits
      // Defaults are configured per client
      "el_min_cpu": 0,
      "el_max_cpu": 0,
      "el_min_mem": 0,
      "el_max_mem": 0,

      // Beacon node minimum and maximum CPU (millicpu) and memory (MB) limits
      // Defaults are configured per client
      "bn_min_cpu": 0,
      "bn_max_cpu": 0,
      "bn_min_mem": 0,
      "bn_max_mem": 0,

      // Validator node minimum and maximum CPU (millicpu) and memory (MB) limits
      // Defaults are configured per client
      "v_min_cpu": 0,
      "v_max_cpu": 0,
      "v_min_mem": 0,
      "v_max_mem": 0,

      // The number of times this participant should be repeated
      // defaults to 1(i.e no repetition). This is optional.
      "count": 1
    }
  ],

  //  Configuration parameters for the Eth network
  "network_params": {
    //  The network ID of the Eth1 network
    "network_id": "3151908",

    //  The address of the staking contract address on the Eth1 chain
    "deposit_contract_address": "0x4242424242424242424242424242424242424242",

    //  Number of seconds per slot on the Beacon chain
    "seconds_per_slot": 12,

    //  Number of slots in an epoch on the Beacon chain
    "slots_per_epoch": 32,

    //  The number of validator keys that each CL validator node should get
    "num_validator_keys_per_node": 64,

    //  This mnemonic will a) be used to create keystores for all the types of validators that we have and b) be used to generate a CL genesis.ssz that has the children
    //   validator keys already preregistered as validators
    "preregistered_validator_keys_mnemonic": "giant issue aisle success illegal bike spike question tent bar rely arctic volcano long crawl hungry vocal artwork sniff fantasy very lucky have athlete"
  },

  // Parallelizes keystore generation so that each node has keystores being generated in their own container
  // Use against large clusters only
  "parallel_keystore_generation": false
}
```

</details>

For example, this `eth-network-params.json` adds a second node, running a different EL/CL client configuration.

```json
{
  "//note": "each participant struct in particpants corresponds to a node in the network",
  "participants": [
    {
      "el_client_type": "geth",
      "el_client_image": "",
      "el_client_log_level": "",
      "cl_client_type": "lighthouse",
      "cl_client_image": "",
      "cl_client_log_level": "",
      "beacon_extra_params": [],
      "el_extra_params": [],
      "validator_extra_params": [],
      "builder_network_params": null,
      "count": 1
    },
    {
      "el_client_type": "nethermind",
      "el_client_image": "",
      "el_client_log_level": "",
      "cl_client_type": "teku",
      "cl_client_image": "",
      "cl_client_log_level": "",
      "beacon_extra_params": [],
      "el_extra_params": [],
      "validator_extra_params": [],
      "builder_network_params": null,
      "count": 1
    }
  ],
  "network_params": {
    "preregistered_validator_keys_mnemonic": "giant issue aisle success illegal bike spike question tent bar rely arctic volcano long crawl hungry vocal artwork sniff fantasy very lucky have athlete",
    "num_validator_keys_per_node": 64,
    "network_id": "3151908",
    "deposit_contract_address": "0x4242424242424242424242424242424242424242",
    "seconds_per_slot": 12,
    "slots_per_epoch": 32,
    "genesis_delay": 10,
    "capella_fork_epoch": 1,
    "deneb_fork_epoch": 500,
  },
  "global_client_log_level": "info",
  "parallel_keystore_generation": false
}
```

To run the package with your desired configuration (as specified in your `eth-network-params.json` file), simply run:

```bash
kurtosis run github.com/kurtosis-tech/eth-network-package "$(cat ~/eth-network-params.json)"
```

### Using this in your own package

Kurtosis Packages can be used within other Kurtosis Packages through [composition](https://docs.kurtosis.com/reference/packages). Assuming you want to spin up an Ethereum network and your own service
together, you just need to do the following

```py
# Import the Ethereum Package
eth_network_module = import_module("github.com/kurtosis-tech/eth-network-package/main.star")

# main.star of your Ethereum Network + Service package
def run(plan, args):
    plan.print("Spinning up the Ethereum Network")
    # this will spin up the network and return the output of the Ethereum Network package
    # any args parsed to your package would get passed down to the Ethereum Network package
    eth_network_participants, cl_genesis_timestamp = eth_network_module.run(plan, args)
```
