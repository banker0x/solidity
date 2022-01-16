// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract IfElse {
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function shorthand(uint _x) public pure returns (uint) {
         // shorthand way to write if / else statement
        return _x < 10 ? 1 : 2;
    }
}
