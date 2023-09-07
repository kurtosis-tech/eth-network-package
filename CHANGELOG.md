# Changelog

## [2.0.0](https://github.com/kurtosis-tech/eth-network-package/compare/1.0.0...2.0.0) (2023-09-06)


### ⚠ BREAKING CHANGES

* calculate genesis validators root ([#90](https://github.com/kurtosis-tech/eth-network-package/issues/90))

### Features

* add a new prefunded account ([#20](https://github.com/kurtosis-tech/eth-network-package/issues/20)) ([4abb7f1](https://github.com/kurtosis-tech/eth-network-package/commit/4abb7f19cbf594996ae4c83c0a1b61e9e0c84dc1))
* add all bootnodes to ELs ([#102](https://github.com/kurtosis-tech/eth-network-package/issues/102)) ([c9a5e96](https://github.com/kurtosis-tech/eth-network-package/commit/c9a5e964e1c1c2caf27ea5e6f3c35cb3f9b8b6de))
* Add all network config options to README ([#11](https://github.com/kurtosis-tech/eth-network-package/issues/11)) ([87c3582](https://github.com/kurtosis-tech/eth-network-package/commit/87c3582f60cec29aff8f129dfc88a29b6a97dd6a))
* add default network params json ([#7](https://github.com/kurtosis-tech/eth-network-package/issues/7)) ([2836f9c](https://github.com/kurtosis-tech/eth-network-package/commit/2836f9c79b287fa62e5e9fa276e875ace5a623db))
* add deneb support ([#28](https://github.com/kurtosis-tech/eth-network-package/issues/28)) ([9d9b1df](https://github.com/kurtosis-tech/eth-network-package/commit/9d9b1df3e3abed6814304c1172cbede4c9209c7e))
* add engine rpc snooper ([#91](https://github.com/kurtosis-tech/eth-network-package/issues/91)) ([b6a5c35](https://github.com/kurtosis-tech/eth-network-package/commit/b6a5c350d6bd2ad563213cd75329d079b1608b15))
* add ethereumjs ([#107](https://github.com/kurtosis-tech/eth-network-package/issues/107)) ([2ed76a1](https://github.com/kurtosis-tech/eth-network-package/commit/2ed76a172c7088204a3771e8c723e5a9aa804608))
* add jwt secret to el_client_context ([#26](https://github.com/kurtosis-tech/eth-network-package/issues/26)) ([9fff2bc](https://github.com/kurtosis-tech/eth-network-package/commit/9fff2bc81e587539ecd68e7a46e1cfccf54edefe))
* add resource management ([#64](https://github.com/kurtosis-tech/eth-network-package/issues/64)) ([a8240b1](https://github.com/kurtosis-tech/eth-network-package/commit/a8240b1994c9cda8bfd1b5bf592acda22137c4e4))
* add service_name to the el client context ([#53](https://github.com/kurtosis-tech/eth-network-package/issues/53)) ([0b39ea4](https://github.com/kurtosis-tech/eth-network-package/commit/0b39ea4063af1c26de922cf5332ed636da981d43))
* add static peers to erigon ([#110](https://github.com/kurtosis-tech/eth-network-package/issues/110)) ([bedc37d](https://github.com/kurtosis-tech/eth-network-package/commit/bedc37dc9054c24566384ebdb1be9bdcb66075e3))
* add support for reth ([#67](https://github.com/kurtosis-tech/eth-network-package/issues/67)) ([2d0c53c](https://github.com/kurtosis-tech/eth-network-package/commit/2d0c53c462ce173024d2fb47f1420821c336318e))
* Adding configurable slot time ([#32](https://github.com/kurtosis-tech/eth-network-package/issues/32)) ([7b01db3](https://github.com/kurtosis-tech/eth-network-package/commit/7b01db3b1b3dce1c3a4457a0516b6049e5ff624d))
* bump ethereum genesis generator to be 4788 compliant ([#92](https://github.com/kurtosis-tech/eth-network-package/issues/92)) ([979faf2](https://github.com/kurtosis-tech/eth-network-package/commit/979faf2d525ddad786bc5f0742d78695a285b33b))
* calculate genesis validators root ([#90](https://github.com/kurtosis-tech/eth-network-package/issues/90)) ([9295b39](https://github.com/kurtosis-tech/eth-network-package/commit/9295b3997aef6678f670d5d99c5ca7e6ff64d281))
* enable capella at epoch 0, or non 0 ([#61](https://github.com/kurtosis-tech/eth-network-package/issues/61)) ([30d2ccf](https://github.com/kurtosis-tech/eth-network-package/commit/30d2ccf8feae4fadc859a19c4a0697f2659cc90b))
* **formatting:** Add editorconfig, move everything to using tabs (4) ([#50](https://github.com/kurtosis-tech/eth-network-package/issues/50)) ([d9f9f4f](https://github.com/kurtosis-tech/eth-network-package/commit/d9f9f4f3e913fc8ccbfd53797462dd586123a203))
* generate keystores parallely ([#82](https://github.com/kurtosis-tech/eth-network-package/issues/82)) ([8b4943f](https://github.com/kurtosis-tech/eth-network-package/commit/8b4943fb3854d2e93738779cf9f1a10eda1bb979))
* get trusted contacts and parsed beacon state ([#30](https://github.com/kurtosis-tech/eth-network-package/issues/30)) ([75744dd](https://github.com/kurtosis-tech/eth-network-package/commit/75744dd23b615e51e1a1bae57e62cd2de43ad268))
* low block time & genesis and ability to run non replay contracts ([#23](https://github.com/kurtosis-tech/eth-network-package/issues/23)) ([47bac9b](https://github.com/kurtosis-tech/eth-network-package/commit/47bac9b9d46bcafff7bb9b512f32de032133b382))
* make most cls archive by default ([#109](https://github.com/kurtosis-tech/eth-network-package/issues/109)) ([7e99047](https://github.com/kurtosis-tech/eth-network-package/commit/7e99047e01bd99a08ac72fcf5cca98f7d2a1b9f5))
* Rename keytores to match their respective CL name ([#71](https://github.com/kurtosis-tech/eth-network-package/issues/71)) ([83e68b2](https://github.com/kurtosis-tech/eth-network-package/commit/83e68b2de2a95c2401992eef30b340de38a84600))
* return cl genesis timestamp ([#18](https://github.com/kurtosis-tech/eth-network-package/issues/18)) ([27aebce](https://github.com/kurtosis-tech/eth-network-package/commit/27aebce80197722b461f14924e7e3a3c3bcf0230))
* Return participants list ([#13](https://github.com/kurtosis-tech/eth-network-package/issues/13)) ([5079dc6](https://github.com/kurtosis-tech/eth-network-package/commit/5079dc6cc01c0daedb1f83b509a1c01f48995181))
* service name should start with alphabetical character ([#63](https://github.com/kurtosis-tech/eth-network-package/issues/63)) ([8092cc1](https://github.com/kurtosis-tech/eth-network-package/commit/8092cc1dbad0f27766ea382c51a3cc84e3618269))
* Set capella at epoch=0 ([#55](https://github.com/kurtosis-tech/eth-network-package/issues/55)) ([871173a](https://github.com/kurtosis-tech/eth-network-package/commit/871173afd15e7f328e9f287288bade537da696c4))
* support multiple bootnodes & static peer ids ([#81](https://github.com/kurtosis-tech/eth-network-package/issues/81)) ([a71204c](https://github.com/kurtosis-tech/eth-network-package/commit/a71204c4ddd6cfacf7bf109e85aec506c917a58b))
* support repeating the exec/consensus client pairs via count ([#49](https://github.com/kurtosis-tech/eth-network-package/issues/49)) ([2f10aa5](https://github.com/kurtosis-tech/eth-network-package/commit/2f10aa5460502ef0efc148723e529ad082e02db8))
* use actual client names for beacon/validator nodes, fixes [#46](https://github.com/kurtosis-tech/eth-network-package/issues/46) ([#47](https://github.com/kurtosis-tech/eth-network-package/issues/47)) ([5ee35b5](https://github.com/kurtosis-tech/eth-network-package/commit/5ee35b5859acc321dc8306c745aadf1a758b90e6))


### Bug Fixes

* add extra nimbus flags, fix validator mismatch ([#76](https://github.com/kurtosis-tech/eth-network-package/issues/76)) ([a64f7aa](https://github.com/kurtosis-tech/eth-network-package/commit/a64f7aa8d8a96468cb6c5ab3a1872cd9ac0f4226))
* add web3 for besu ([#104](https://github.com/kurtosis-tech/eth-network-package/issues/104)) ([53e004c](https://github.com/kurtosis-tech/eth-network-package/commit/53e004cd01af3c9aac9a1d3296c777817db94f98))
* allow reth to be the first node ([#74](https://github.com/kurtosis-tech/eth-network-package/issues/74)) ([2895a00](https://github.com/kurtosis-tech/eth-network-package/commit/2895a00dc68d9959b913a62743a048be2bdb9509)), closes [#70](https://github.com/kurtosis-tech/eth-network-package/issues/70)
* bad index ([#77](https://github.com/kurtosis-tech/eth-network-package/issues/77)) ([6db2e07](https://github.com/kurtosis-tech/eth-network-package/commit/6db2e0791138cc093c178d14257c3c5d187d3ec1))
* besu flag update ([#56](https://github.com/kurtosis-tech/eth-network-package/issues/56)) ([3ec2850](https://github.com/kurtosis-tech/eth-network-package/commit/3ec28507d54c107c1304eaba43da8e479a82d7c8))
* Bump genesis generator ([#99](https://github.com/kurtosis-tech/eth-network-package/issues/99)) ([97ce5dc](https://github.com/kurtosis-tech/eth-network-package/commit/97ce5dccad6b531d34d76884a23767be1fb23787))
* capella is 1 epoch by default ([#60](https://github.com/kurtosis-tech/eth-network-package/issues/60)) ([03ee193](https://github.com/kurtosis-tech/eth-network-package/commit/03ee193a4e76ca7a731a431d818f3b0614215725))
* change suggested fee recipient to first genesis funded address ([#66](https://github.com/kurtosis-tech/eth-network-package/issues/66)) ([cf16fc3](https://github.com/kurtosis-tech/eth-network-package/commit/cf16fc3ba38b98fc313e08455769f489b725411c))
* de-duplicate extra-parameter parsing ([#113](https://github.com/kurtosis-tech/eth-network-package/issues/113)) ([44b5087](https://github.com/kurtosis-tech/eth-network-package/commit/44b5087bd6b47ee73a8a43c8911e1dad936f4c6c))
* delay network freeze around deneb by delaying deneb ([#43](https://github.com/kurtosis-tech/eth-network-package/issues/43)) ([ba3a2bc](https://github.com/kurtosis-tech/eth-network-package/commit/ba3a2bc249083d9a58327586802aa08f071d9745))
* Deprecating nethermind config hardcode ([#33](https://github.com/kurtosis-tech/eth-network-package/issues/33)) ([7e75a31](https://github.com/kurtosis-tech/eth-network-package/commit/7e75a31fae291688024c15cf075909717d54a397))
* fix capella/shanghai timing to prevent network from getting locked ([#29](https://github.com/kurtosis-tech/eth-network-package/issues/29)) ([04aee0c](https://github.com/kurtosis-tech/eth-network-package/commit/04aee0cb40cb61700426fbc80c8bedc50583e90d))
* fix maximum enr bug ([#86](https://github.com/kurtosis-tech/eth-network-package/issues/86)) ([9c2bc79](https://github.com/kurtosis-tech/eth-network-package/commit/9c2bc79da5273c7ca972a3ab55884e96bd1318f8))
* Fixes nimbus node runtime expectation of deposit contract block hash ([#51](https://github.com/kurtosis-tech/eth-network-package/issues/51)) ([4074d55](https://github.com/kurtosis-tech/eth-network-package/commit/4074d558af41fab9364d2be6591fced9d8e29235))
* genesis validators root reader ([#106](https://github.com/kurtosis-tech/eth-network-package/issues/106)) ([f41eb9c](https://github.com/kurtosis-tech/eth-network-package/commit/f41eb9c5bb4a437d6d6f2220be9953fb8ad076b1))
* give account 7 some tokens ([#40](https://github.com/kurtosis-tech/eth-network-package/issues/40)) ([16e2d89](https://github.com/kurtosis-tech/eth-network-package/commit/16e2d89ec706106c02ba7ad04d9d83dd74793607))
* limit to the first 20 enrs for peering only ([#85](https://github.com/kurtosis-tech/eth-network-package/issues/85)) ([09ac414](https://github.com/kurtosis-tech/eth-network-package/commit/09ac414c25c5a003e59ee101dd8bf9b3eb2e03f4))
* lodestar arg update ([#57](https://github.com/kurtosis-tech/eth-network-package/issues/57)) ([8745c7c](https://github.com/kurtosis-tech/eth-network-package/commit/8745c7c33f53f26b69b476890a909c77a17225f4))
* lodestar enr issues ([#84](https://github.com/kurtosis-tech/eth-network-package/issues/84)) ([6ccedbe](https://github.com/kurtosis-tech/eth-network-package/commit/6ccedbe1b9aa63db17febd88a857f1efd5c07d12))
* lodestar metrics port are better now ([#38](https://github.com/kurtosis-tech/eth-network-package/issues/38)) ([2a2576e](https://github.com/kurtosis-tech/eth-network-package/commit/2a2576ea41eeec30fa40eeb89c49a5ed6217a164))
* lower capella fork epoch to 1 and change CL capella calculation ([#25](https://github.com/kurtosis-tech/eth-network-package/issues/25)) ([0e36ac4](https://github.com/kurtosis-tech/eth-network-package/commit/0e36ac4f7463e7624f1599b61ab8fb9acdf6e9b3))
* make besu a bootnode ([#108](https://github.com/kurtosis-tech/eth-network-package/issues/108)) ([8396650](https://github.com/kurtosis-tech/eth-network-package/commit/83966505428715873d8206d40beba33095d0ed0a))
* moved out parallel keystore generation ([#100](https://github.com/kurtosis-tech/eth-network-package/issues/100)) ([1ed13f7](https://github.com/kurtosis-tech/eth-network-package/commit/1ed13f7c2aa4fb74a8b016a4330c1e2710341ff8))
* Nethermind cleanup ([#98](https://github.com/kurtosis-tech/eth-network-package/issues/98)) ([866da67](https://github.com/kurtosis-tech/eth-network-package/commit/866da67d9fad31f5ada2c33c3d6a30f2f085ed49))
* nimbus fails early with &lt;12 seconds per slot ([#44](https://github.com/kurtosis-tech/eth-network-package/issues/44)) ([07d81fa](https://github.com/kurtosis-tech/eth-network-package/commit/07d81fa0b5e5a2d71598da15033c07f1a07068b7))
* prysm clients and cli flags passed ([#34](https://github.com/kurtosis-tech/eth-network-package/issues/34)) ([6d1ef7b](https://github.com/kurtosis-tech/eth-network-package/commit/6d1ef7b8c0eceb438d9555baf986ce0052398b74))
* prysm validator ([#62](https://github.com/kurtosis-tech/eth-network-package/issues/62)) ([63ae539](https://github.com/kurtosis-tech/eth-network-package/commit/63ae5394cd4199f558f9067b6de5196f9c6da424))
* put boot node behind if condition for reth ([#69](https://github.com/kurtosis-tech/eth-network-package/issues/69)) ([b3de5e4](https://github.com/kurtosis-tech/eth-network-package/commit/b3de5e4f0c8030415ee2c28f6b21d6202e90ee30))
* remove hardcoded key from geth ([#117](https://github.com/kurtosis-tech/eth-network-package/issues/117)) ([260abff](https://github.com/kurtosis-tech/eth-network-package/commit/260abff1e64ea95ae3982b467ff07e1d2ea99bd5))
* Remove nethermind bootnode restrictions ([#97](https://github.com/kurtosis-tech/eth-network-package/issues/97)) ([3678158](https://github.com/kurtosis-tech/eth-network-package/commit/3678158805cd2a83111d8c72ac92742a92399ace))
* Remove nethermind restriction ([#95](https://github.com/kurtosis-tech/eth-network-package/issues/95)) ([417241f](https://github.com/kurtosis-tech/eth-network-package/commit/417241ffac7d72b608504fae1590250ecc3f11af))
* remove unused config params ([#10](https://github.com/kurtosis-tech/eth-network-package/issues/10)) ([4c2ccaa](https://github.com/kurtosis-tech/eth-network-package/commit/4c2ccaa8af5a5d4a855b572974c15b6a49f1b81a))
* revert seconds per slot ([#31](https://github.com/kurtosis-tech/eth-network-package/issues/31)) ([959729e](https://github.com/kurtosis-tech/eth-network-package/commit/959729e038ad4fee58bc3cdcbfe4ee5c00facb68))
* Stale flags and image versions ([#35](https://github.com/kurtosis-tech/eth-network-package/issues/35)) ([46b8b29](https://github.com/kurtosis-tech/eth-network-package/commit/46b8b293337b087fb9941afa673b713f820ddd61))
* teku local networking ([#58](https://github.com/kurtosis-tech/eth-network-package/issues/58)) ([bf6b8b2](https://github.com/kurtosis-tech/eth-network-package/commit/bf6b8b2eec816474643c2e829f5d8d04437861f2))
* truncate enode after `?` ([#103](https://github.com/kurtosis-tech/eth-network-package/issues/103)) ([bdd51dd](https://github.com/kurtosis-tech/eth-network-package/commit/bdd51dddcc4ac4ed95a78d9d39c68e6478593c1a))
* Update CL config for teku ([#37](https://github.com/kurtosis-tech/eth-network-package/issues/37)) ([f5c6eb4](https://github.com/kurtosis-tech/eth-network-package/commit/f5c6eb4c40e52e88842b27da8f8d09d9a452784a))
* Update default client images ([#14](https://github.com/kurtosis-tech/eth-network-package/issues/14)) ([c2cdf0f](https://github.com/kurtosis-tech/eth-network-package/commit/c2cdf0f886dc0060f76219e1e7b0e9b6a33d3c7d))
* use reth from github container registry ([#101](https://github.com/kurtosis-tech/eth-network-package/issues/101)) ([4871092](https://github.com/kurtosis-tech/eth-network-package/commit/4871092cdbee2773510f3bac71dc581e0d470e9b))
* use run_python to calculate genesis time ([#116](https://github.com/kurtosis-tech/eth-network-package/issues/116)) ([67930a8](https://github.com/kurtosis-tech/eth-network-package/commit/67930a82be964260e692583522ff2db36b2760b2))

## 1.0.0 (2023-03-31)

### Features

- add readme ([#5](https://github.com/kurtosis-tech/eth-network-package/issues/5)) ([c4b602b](https://github.com/kurtosis-tech/eth-network-package/commit/c4b602b84fc411fceb45cf632fd743376a2c4a2a))

### Bug Fixes

- update input parser with arg parsing fixes ([#2](https://github.com/kurtosis-tech/eth-network-package/issues/2)) ([4f37e0a](https://github.com/kurtosis-tech/eth-network-package/commit/4f37e0a9a02a5a2e9be192f7dab64a757c7ae652))

## 0.0.0

- Initial commit
