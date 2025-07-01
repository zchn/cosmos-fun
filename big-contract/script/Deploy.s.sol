// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/LargeContract.sol";

/// @notice Simple deployment script for the LargeContract
contract DeployLargeScript is Script {
    function run() external {
        vm.startBroadcast();
        new LargeContract();
        vm.stopBroadcast();
    }
}
