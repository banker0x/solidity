//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Timestamp {

    address public owner;
    uint256 public deadline;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 numberOfDays) public payable {
        deadline = block.timestamp + (numberOfDays * 1 days);
    }
    
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function canWithdraw() external view returns(bool) {
        return block.timestamp >= deadline;
    }

    function withdraw() public onlyOwner {
        require(block.timestamp >= deadline);

        uint bal = address(this).balance;

        // withdraw funds
        (bool sent, ) = owner.call{value: bal}("");
        assert(sent);
    }
}
