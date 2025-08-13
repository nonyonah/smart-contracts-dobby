// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Script.sol";
import "../src/TinyFactory.sol";
import "../src/TinyContract.sol";

contract DeployTinyContracts is Script {
    TinyFactory public factory;
    
    function setUp() public {}
    
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        
        // Deploy the factory
        factory = new TinyFactory();
        console.log("TinyFactory deployed at:", address(factory));
        
        // Simulate deploying 2 contracts per day for 7 days
        for (uint256 day = 1; day <= 7; day++) {
            console.log("\nDay", day);
            
            for (uint256 i = 1; i <= 2; i++) {
                // Deploy a new TinyContract
                address contractAddress = factory.deployContract();
                console.log("TinyContract", ((day-1)*2)+i, "deployed at:", contractAddress);
                
                // Generate a random number for the contract
                uint256 randomValue = uint256(keccak256(abi.encodePacked(block.timestamp, day, i))) % 1000;
                
                // Call set() on the deployed contract
                TinyContract(contractAddress).set(randomValue);
                console.log("Set value to:", randomValue);
            }
        }
        
        // Get all deployed contracts
        address[] memory deployedContracts = factory.getDeployedContracts();
        console.log("\nTotal contracts deployed:", deployedContracts.length);
        
        vm.stopBroadcast();
    }
}