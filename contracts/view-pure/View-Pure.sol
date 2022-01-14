// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
View function declares that no state will be changed.

Pure function declares that no state variable will be changed or read.
*/

contract ViewAndPure {
    uint public x = 1;

    // Promise not to MODIFY the state.
    function addToX(uint y) public view returns (uint) {
        // The line below would generate an error, as we are attempting to modify the 
        // state of a view function
        // x = 2;  

        // This line does not modify state
        return x + y;
    }

    // Promise not to MODIFY or READ from the state.
    function add(uint y) public pure returns (uint) {

        // this line creats an error as it attemps to read from the state variable of a pure function
        //return i + j + x;

        return y + 2;
    }
}
