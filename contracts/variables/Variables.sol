// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    There are 3 types of variables in Solidity

    Local: declared inside a function and not stored on the blockchain
    State: declared outside a function and stored on the blockchain
    Global: (provides information about the blockchain)
*/

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public payable {
        // Local variables are not saved to the blockchain.
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
        uint pay = msg.value; // value sent by caller
    }
}
