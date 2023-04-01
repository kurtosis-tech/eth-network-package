Ethereum Network Package
===========================

![Run of the Ethereum Network Package](/run.gif)

This is a Kurtosis Starlark Package that spins up an ethereum network.

### Run

This assumes you have [Kurtosis CLI](https://docs.kurtosis.com/cli/) installed.

Simply run
```bash
kurtosis run github.com/kurtosis-tech/eth-network-package
```

### Configuring the Network

By default, this package spins up a single node with a [`geth`](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/el/geth/geth_launcher.star) EL client and [`lighthouse`](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/cl/lighthouse/lighthouse_launcher.star) CL client (more info on [node architecture](https://ethereum.org/en/developers/docs/nodes-and-clients/node-architecture/)) and comes with [five prefunded keys](https://github.com/kurtosis-tech/eth-network-package/blob/main/src/prelaunch_data_generator/genesis_constants/genesis_constants.star) for testing, but
these and other parameters are configurable through a json file.

For example, this `eth-network-params.json` adds a second node, running a different EL/CL client configuration.
```json
{
  "participants":[{
    "el_client_type":         "geth",
    "el_client_image":        "",
    "el_client_log_level":    "",
    "cl_client_type":         "lighthouse",
    "cl_client_image":        "",
    "cl_client_log_level":    "",
    "beacon_extra_params":    [],
    "el_extra_params":        [],
    "validator_extra_params": [],
    "builder_network_params": null
  },{
    "el_client_type":         "erigon",
    "el_client_image":        "",
    "el_client_log_level":    "",
    "cl_client_type":         "nimbus",
    "cl_client_image":        "",
    "cl_client_log_level":    "",
    "beacon_extra_params":    [],
    "el_extra_params":        [],
    "validator_extra_params": [],
    "builder_network_params": null
  }],
  "network_params":{
    "preregistered_validator_keys_mnemonic": "giant issue aisle success illegal bike spike question tent bar rely arctic volcano long crawl hungry vocal artwork sniff fantasy very lucky have athlete",
    "num_validator_keys_per_node": 64,
    "network_id": "3151908",
    "deposit_contract_address": "0x4242424242424242424242424242424242424242",
    "seconds_per_slot": 12,
    "slots_per_epoch": 32,
    "genesis_delay": 120,
    "capella_fork_epoch": 5
  },
  "wait_for_finalization": false,
  "wait_for_verifications": false,
  "verifications_epoch_limit": 5,
  "global_client_log_level": "info"
}
```
To run the package with your desired configuration, simply run
```bash
kurtosis run github.com/kurtosis-tech/eth-network-package "$(cat ~/eth-network-params.json)"
```

### Using this in your own package

Kurtosis Packages can be used within other Kurtosis Packages through composition. Assuming you want to spin up an ethereum network and your own service
together, you just need to do the following

```py
eth_network_module = import_module("github.com/kurtosis-tech/eth-network-package/main.star")

# main.star of your Ethereum Network + Service package
def run(plan, args):
    plan.print("Spinning up the Ethereum Network")
    # this will spin up the network and return the output of the Ethereum Network package
    # any args parsed to your package would get passed down to the Ethereum Network package
    eth_network_run_output = eth_network_module.run(plan, args)
```

