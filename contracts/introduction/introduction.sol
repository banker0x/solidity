pragma solidity 0.5.16;

contract Trivial {

    uint256 state;  // persistent contract storage
    uint256 count;  // persistent contract storage

    function State(uint256 _state) public {
        state = _state;
    }

    function getPersistentValue() public view returns (uint256) {
        return state;
    }

    // Pure functions ensure that they do not read or modify the state
    function getPureValue() public pure returns (uint256) {
        return 99;
    }

    function setCounter(uint256 _count) public {
        count = _count;
    }

    function increment() public {
        count += 1;
    }

    function getCount() public view returns (uint256) {
        return count;
    }

}
