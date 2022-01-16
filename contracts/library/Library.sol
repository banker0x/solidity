// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/* 
A library is a different type of contract, that doesn't have any storage and CANNOT hold ether. 
Sometimes it is helpful to think of a library as a singleton in the EVM, a piece of code that can be 
called from any contract without the need to deploy it again.
*/

library Math {

    // Pure functions do not read from storage
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}
