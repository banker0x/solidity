pragma solidity 0.5.16;

contract TipJar {

    address owner;    // current owner of the contract

    constructor() public {
        owner = msg.sender;
    }

    function withdraw() public {
        require(owner == msg.sender);

        // Transfer the contract balance back to the owner
        msg.sender.transfer(address(this).balance);
    }

    // As a payable function, $ETH is being sent to this contract
    function deposit(uint256 amount) public payable {
        require(msg.value == amount);
    }

    // Retrive contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}