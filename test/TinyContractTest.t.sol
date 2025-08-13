// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/TinyContract.sol";
import "../src/TinyFactory.sol";

contract TinyContractTest is Test {
    TinyContract public tinyContract;
    TinyFactory public factory;

    function setUp() public {
        tinyContract = new TinyContract();
        factory = new TinyFactory();
    }

    function testSetValue() public {
        uint256 testValue = 42;
        tinyContract.set(testValue);
        assertEq(tinyContract.value(), testValue);
    }

    function testFactoryDeployment() public {
        address deployedAddress = factory.deployContract();
        assertFalse(deployedAddress == address(0));
        
        address[] memory deployedContracts = factory.getDeployedContracts();
        assertEq(deployedContracts.length, 1);
        assertEq(deployedContracts[0], deployedAddress);
    }

    function testMultipleDeployments() public {
        for (uint256 i = 0; i < 5; i++) {
            factory.deployContract();
        }
        
        address[] memory deployedContracts = factory.getDeployedContracts();
        assertEq(deployedContracts.length, 5);
    }

    function testDeployAndSetValue() public {
        address deployedAddress = factory.deployContract();
        TinyContract deployedContract = TinyContract(deployedAddress);
        
        uint256 testValue = 123;
        deployedContract.set(testValue);
        assertEq(deployedContract.value(), testValue);
    }
}