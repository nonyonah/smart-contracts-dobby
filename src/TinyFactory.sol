// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./TinyContract.sol";

contract TinyFactory {
    address[] public deployedContracts;
    
    function deployContract() external returns (address) {
        TinyContract newContract = new TinyContract();
        address contractAddress = address(newContract);
        deployedContracts.push(contractAddress);
        return contractAddress;
    }
    
    function getDeployedContracts() external view returns (address[] memory) {
        return deployedContracts;
    }
}