// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Example file with items that will be imported by another file

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Lib {
    string public name = "Library";
}
