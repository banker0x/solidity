// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Updatable {
  using SafeMath for uint256;

  // Mapping from version number to contract address
  mapping(uint256 => address) public versions;

  // Current version number
  uint256 public currentVersion = 1;

  // Set the initial version of the contract
  constructor() {
    versions[currentVersion] = address(this);
  }

  function update(address newImplementation) public {

    // Check if the caller is the current contract
    require(versions[currentVersion] == address(this), "Caller is not the current contract.");

    // Increment the current version number
    currentVersion = currentVersion.add(1);

    // Save the new implementation address
    versions[currentVersion] = newImplementation;
  }

  function getCurrentImplementation() public view returns (address implementation) {
    // Return the address of the current contract
    return versions[currentVersion];
  }
}
