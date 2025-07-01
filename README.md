# cosmos-fun

This repository contains assorted experiments. The `big-contract` folder
is a minimal [Foundry](https://book.getfoundry.sh/) project that
includes a deployment script used to test maximum contract size limits
on an EVM chain.

## Using the big-contract project

1. Install [Foundry](https://book.getfoundry.sh/)
2. Navigate to `big-contract`
3. Run `forge build` to compile the contract
4. Deploy with `forge script script/Deploy.s.sol --rpc-url <url> --private-key <key> --broadcast`

The `LargeContract` contains many functions to intentionally produce very
large bytecode, helping to test chain limits.
