// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
    Functions and state variables have to declare whether they are accessible by other contracts.

    Functions can be declared as

        public - any contract and account can call
        private - only inside the contract that defines the function
        internal- only inside contract that inherits an internal function
        external - only other contracts and accounts can call

    State variables can be declared as public, private, or internal but not external.
*/

contract Base {
    // Private function can only be called
    // - inside this contract
    // Contracts that inherit this contract cannot call this function.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    // A function that allows an inheriting contract to override its behavior will be marked at virtual
    // The function listed below will be overrided in the below example
    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External functions can only be called
    // - by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // State variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
}

contract Child is Base {

    // Internal function call be called inside child contracts.
    // The function that overrides that base function should be marked as override
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
