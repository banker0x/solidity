// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    An error will undo ALL changes made to the state during a transaction.

    You can throw an error by calling:

        require: is used to validate inputs and conditions before execution.
        revert: is similar to require. 
        assert: is used to check for code that should never be false. 
*/

contract Error {
    
    function testRequire(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        assert(num == 0);
    }

    // Custom Error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance(bal, _withdrawAmount);

            // Another way to throw a custom error with revert
            //revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}
