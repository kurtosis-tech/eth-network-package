# Changelog

## [1.1.0](https://github.com/kurtosis-tech/eth-network-package/compare/1.0.0...1.1.0) (2023-07-10)


### Features

* add a new prefunded account ([#20](https://github.com/kurtosis-tech/eth-network-package/issues/20)) ([4abb7f1](https://github.com/kurtosis-tech/eth-network-package/commit/4abb7f19cbf594996ae4c83c0a1b61e9e0c84dc1))
* Add all network config options to README ([#11](https://github.com/kurtosis-tech/eth-network-package/issues/11)) ([87c3582](https://github.com/kurtosis-tech/eth-network-package/commit/87c3582f60cec29aff8f129dfc88a29b6a97dd6a))
* add default network params json ([#7](https://github.com/kurtosis-tech/eth-network-package/issues/7)) ([2836f9c](https://github.com/kurtosis-tech/eth-network-package/commit/2836f9c79b287fa62e5e9fa276e875ace5a623db))
* add deneb support ([#28](https://github.com/kurtosis-tech/eth-network-package/issues/28)) ([9d9b1df](https://github.com/kurtosis-tech/eth-network-package/commit/9d9b1df3e3abed6814304c1172cbede4c9209c7e))
* add jwt secret to el_client_context ([#26](https://github.com/kurtosis-tech/eth-network-package/issues/26)) ([9fff2bc](https://github.com/kurtosis-tech/eth-network-package/commit/9fff2bc81e587539ecd68e7a46e1cfccf54edefe))
* Adding configurable slot time ([#32](https://github.com/kurtosis-tech/eth-network-package/issues/32)) ([7b01db3](https://github.com/kurtosis-tech/eth-network-package/commit/7b01db3b1b3dce1c3a4457a0516b6049e5ff624d))
* get trusted contacts and parsed beacon state ([#30](https://github.com/kurtosis-tech/eth-network-package/issues/30)) ([75744dd](https://github.com/kurtosis-tech/eth-network-package/commit/75744dd23b615e51e1a1bae57e62cd2de43ad268))
* low block time & genesis and ability to run non replay contracts ([#23](https://github.com/kurtosis-tech/eth-network-package/issues/23)) ([47bac9b](https://github.com/kurtosis-tech/eth-network-package/commit/47bac9b9d46bcafff7bb9b512f32de032133b382))
* return cl genesis timestamp ([#18](https://github.com/kurtosis-tech/eth-network-package/issues/18)) ([27aebce](https://github.com/kurtosis-tech/eth-network-package/commit/27aebce80197722b461f14924e7e3a3c3bcf0230))
* Return participants list ([#13](https://github.com/kurtosis-tech/eth-network-package/issues/13)) ([5079dc6](https://github.com/kurtosis-tech/eth-network-package/commit/5079dc6cc01c0daedb1f83b509a1c01f48995181))
* support repeating the exec/consensus client pairs via count ([#49](https://github.com/kurtosis-tech/eth-network-package/issues/49)) ([2f10aa5](https://github.com/kurtosis-tech/eth-network-package/commit/2f10aa5460502ef0efc148723e529ad082e02db8))


### Bug Fixes

* delay network freeze around deneb by delaying deneb ([#43](https://github.com/kurtosis-tech/eth-network-package/issues/43)) ([ba3a2bc](https://github.com/kurtosis-tech/eth-network-package/commit/ba3a2bc249083d9a58327586802aa08f071d9745))
* Deprecating nethermind config hardcode ([#33](https://github.com/kurtosis-tech/eth-network-package/issues/33)) ([7e75a31](https://github.com/kurtosis-tech/eth-network-package/commit/7e75a31fae291688024c15cf075909717d54a397))
* fix capella/shanghai timing to prevent network from getting locked ([#29](https://github.com/kurtosis-tech/eth-network-package/issues/29)) ([04aee0c](https://github.com/kurtosis-tech/eth-network-package/commit/04aee0cb40cb61700426fbc80c8bedc50583e90d))
* give account 7 some tokens ([#40](https://github.com/kurtosis-tech/eth-network-package/issues/40)) ([16e2d89](https://github.com/kurtosis-tech/eth-network-package/commit/16e2d89ec706106c02ba7ad04d9d83dd74793607))
* lodestar metrics port are better now ([#38](https://github.com/kurtosis-tech/eth-network-package/issues/38)) ([2a2576e](https://github.com/kurtosis-tech/eth-network-package/commit/2a2576ea41eeec30fa40eeb89c49a5ed6217a164))
* lower capella fork epoch to 1 and change CL capella calculation ([#25](https://github.com/kurtosis-tech/eth-network-package/issues/25)) ([0e36ac4](https://github.com/kurtosis-tech/eth-network-package/commit/0e36ac4f7463e7624f1599b61ab8fb9acdf6e9b3))
* nimbus fails early with &lt;12 seconds per slot ([#44](https://github.com/kurtosis-tech/eth-network-package/issues/44)) ([07d81fa](https://github.com/kurtosis-tech/eth-network-package/commit/07d81fa0b5e5a2d71598da15033c07f1a07068b7))
* prysm clients and cli flags passed ([#34](https://github.com/kurtosis-tech/eth-network-package/issues/34)) ([6d1ef7b](https://github.com/kurtosis-tech/eth-network-package/commit/6d1ef7b8c0eceb438d9555baf986ce0052398b74))
* remove unused config params ([#10](https://github.com/kurtosis-tech/eth-network-package/issues/10)) ([4c2ccaa](https://github.com/kurtosis-tech/eth-network-package/commit/4c2ccaa8af5a5d4a855b572974c15b6a49f1b81a))
* revert seconds per slot ([#31](https://github.com/kurtosis-tech/eth-network-package/issues/31)) ([959729e](https://github.com/kurtosis-tech/eth-network-package/commit/959729e038ad4fee58bc3cdcbfe4ee5c00facb68))
* Stale flags and image versions ([#35](https://github.com/kurtosis-tech/eth-network-package/issues/35)) ([46b8b29](https://github.com/kurtosis-tech/eth-network-package/commit/46b8b293337b087fb9941afa673b713f820ddd61))
* Update CL config for teku ([#37](https://github.com/kurtosis-tech/eth-network-package/issues/37)) ([f5c6eb4](https://github.com/kurtosis-tech/eth-network-package/commit/f5c6eb4c40e52e88842b27da8f8d09d9a452784a))
* Update default client images ([#14](https://github.com/kurtosis-tech/eth-network-package/issues/14)) ([c2cdf0f](https://github.com/kurtosis-tech/eth-network-package/commit/c2cdf0f886dc0060f76219e1e7b0e9b6a33d3c7d))

## 1.0.0 (2023-03-31)


### Features

* add readme ([#5](https://github.com/kurtosis-tech/eth-network-package/issues/5)) ([c4b602b](https://github.com/kurtosis-tech/eth-network-package/commit/c4b602b84fc411fceb45cf632fd743376a2c4a2a))


### Bug Fixes

* update input parser with arg parsing fixes ([#2](https://github.com/kurtosis-tech/eth-network-package/issues/2)) ([4f37e0a](https://github.com/kurtosis-tech/eth-network-package/commit/4f37e0a9a02a5a2e9be192f7dab64a757c7ae652))

## 0.0.0
- Initial commit
