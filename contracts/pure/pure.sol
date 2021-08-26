pragma solidity 0.5.16;

contract Trivial {

    // Pure functions ensure that they do not read or modify the state
    function getValue() public pure returns (uint256) {
        return 99;
    }

}
