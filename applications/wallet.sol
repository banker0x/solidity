//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Anyone can send ETH.
    Only the owner can withdraw.
*/

contract Wallet {

    // Storage variables
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    event Log(string message);

    modifier onlyOwner() {
        assert(msg.sender == owner);
        _;
    }

    function getBalance() external  view returns (uint) {
        return address(this).balance;
    }

    // Only the owner of wallet can withdraw ether
    function withdraw(uint _amount) onlyOwner external {
        
        uint balance = address(this).balance;
        
        // Confirm withdrawal amount
        require(_amount >= 0, "Negative amounts not allowed");
        require(_amount <= balance, "Insufficient balance");
        
        // withdraw funds
        (bool sent, ) = owner.call{value: _amount}("");
        assert(sent);
    } 

    // executed when msg.data (i.e. calldata) is empty
    receive() external payable {
        emit Log("receive called.");
    }

    // function executed when msg.data is NOT empty
    fallback() external payable {
        emit Log("fallback called.");
    }
}
