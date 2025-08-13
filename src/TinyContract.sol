// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract TinyContract {
    uint256 public value;
    
    function set(uint256 newValue) external {
        value = newValue;
    }
}