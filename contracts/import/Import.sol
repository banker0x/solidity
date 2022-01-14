// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Example #1: import via github
//import "https://github.com/matsikas/solidity/tree/main/contracts/import/Lib.sol";

// Example #2: import specific items from a file
// import {symbol1 as alias, symbol2} from "filename";
// import {Unauthorized, add as func, Point} from "./Lib.sol";

// Example #3: import via directory structure in remix
import "./Lib.sol";

contract Import {
    // Create Lib.sol contract contract
    Lib public lib = new Lib();

    // Test Lib.sol add function from imported library
    function testAdd() public pure returns (uint) {
        return add(1, 2);
    }

    // Test Lib.sol contract by getting it's name.
    function testGetName() public view returns (string memory) {
        return lib.name();
    }
}
