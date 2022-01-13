// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Kill {

    constructor() payable {}

    function kill() external {
        // Self destruct function will send all contract ether
        // to the specified account
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint) {
        return 123; 
    }
}
