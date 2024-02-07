// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {EntryPoint} from "@account-abstraction/contracts/core/EntryPoint.sol";
import {IAccount} from "@account-abstraction/contracts/interfaces/IAccount.sol";
import {UserOperation} from "@account-abstraction/contracts/interfaces/UserOperation.sol";

contract SmartAccount is IAccount {
    uint256 public s_count;
    address public s_owner;

    constructor(address _owner) {
        s_owner = _owner;
    }

    function validateUserOp(
        UserOperation calldata, /* userOp */
        bytes32, /* userOpHash */
        uint256 /* missingAccountFunds */
    ) external pure returns (uint256 validationData) {
        return 0;
    }

    function execute() external {
        s_count++;
    }
}

contract AccountFactory {
    function createAccount(address owner) external returns (address smartAccount) {
        return address(new SmartAccount(owner));
    }
}
