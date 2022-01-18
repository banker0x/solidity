// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract HashFunction {
    
    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32) {
        
        // keccak256 requires inputs as bytes, and can take any number of inputs
        // abi.encode & abi.encodePacked can transfor inputs into bytes for the keccak hash function
        return keccak256(abi.encodePacked(_text, _num, _addr));

        // Example of hash collision
        // Hash collision can occur when you pass more than one dynamic data type
        // to abi.encodePacked. In such case, you should use abi.encode instead.
        
        // Example:
        // encodePacked("AAA", "BBB") -> AAABBB
        // encodePacked("AA", "ABBB") -> AAABBB
        // Therefore keccak hash function will produce the same output with both variables

        // Solution: use abi.encode instead of abi.encodePacked 
        // return keccak256(abi.encode(_text, _num, _addr));

    }
}

// Example contract using hashing to save a private password
contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
