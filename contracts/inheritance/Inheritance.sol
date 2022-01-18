// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Contracts can inherit other contract by using the IS keyword.
    Function that is going to be overridden by a child contract must be declared as virtual.
    Function that is going to override a parent function must use the keyword override.

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    // Override B.foo()
    function foo() public pure override returns (string memory) {
        return "C";
    }
}
