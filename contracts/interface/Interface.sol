// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Interface:

        Cannot have any functions implemented
        Can inherit from other interfaces
        All declared functions must be external
        Cannot declare a constructor
        Cannot declare state variables
*/

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}
