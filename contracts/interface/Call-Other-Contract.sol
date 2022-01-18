// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract A {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {

    function setX(A _a, uint _x) public {
        _a.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        A a = A(_addr);
        a.setX(_x);
    }

    function setXandSendEther(A _a, uint _x) public payable {
        // function returns to variables
        // function accepts one variable as input
        // between the {} we can send the ether
        (uint x, uint value) = _a.setXandSendEther{value: msg.value}(_x);
    }
}
