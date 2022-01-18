// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Solidity also supports multiple inheritance. 

    Order of inheritance is important:

    You have to list the parent contracts in the order from “most base-like” to “most derived”.
    The most "base-like" contract is the contract that has the least parents above it.

    Example:
    contract X          // Does not inhert from anyone
    contract Y is X     // Inherites from a single contract
    contract Z is X,Y   // Inherites from two contracts, listed in the order of most base like.

    Order of most base like is: X, Y, Z 

*/

contract A {
    function foo() public pure virtual returns (string memory) {
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

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts (listed from most base like).

// When a function is CALLED that is defined multiple times in different contracts, parent contracts 
// are searched from RIGHT to LEFT, and IN-DEPTH first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {

    // This function overrides both its parents contracts A & B
    function foo() public pure override(A, B) returns (string memory) {

        // Parent contracts are searched from RIGHT to LEFT, and IN-DEPTH first manner.
        // Therfore function returns "B"
        return super.foo();
    }
}
