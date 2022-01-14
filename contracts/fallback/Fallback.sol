// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/*
Fallback or Receive is executed when Ether is sent to contract or the function doesn't exist

msg.data can be populated via CALLDATA

Fallback executed when:
    -fallback() function exists
    -msg.data is NOT empty or as a backup when receive function does NOT exists

Receive executed when
    -receive() function exists
    -msg.data is empty
*/

contract Fallback {

    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}
