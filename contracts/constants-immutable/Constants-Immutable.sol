// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//The difference is that constant variables can never be changed after compilation, while immutable variables can be set within the constructor.

contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000000;
    uint public constant MY_UINT = 123;
}

// Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
contract Immutable {
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
