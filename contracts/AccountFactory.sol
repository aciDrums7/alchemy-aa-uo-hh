// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SmartAccount} from "./SmartAccount.sol";

contract AccountFactory {
    function createAccount(address owner) external returns (address) {
        return address(new SmartAccount(owner));
    }
}
