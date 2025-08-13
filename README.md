# Minimal Smart Contract Deployment System

This project contains ultra-minimal smart contracts designed for cheap deployment on Base mainnet, along with a factory contract and deployment script.

## Contracts

### TinyContract
- Minimal contract with a single uint256 variable and a setter function
- Optimized for low deployment cost
- No constructor or unnecessary imports

### TinyFactory
- Deploys new instances of TinyContract
- Stores deployed contract addresses
- Provides function to retrieve all deployed contracts

## Deployment Script

The `DeployTinyContracts.s.sol` script:
- Deploys the TinyFactory contract
- Simulates deploying two TinyContracts per day for 7 days (14 total)
- Calls `set()` on each deployed contract with a random value

## Gas Estimates

### Base Mainnet Estimates

| Operation | Estimated Gas | Estimated Cost (at 0.1 gwei) |
|-----------|--------------|------------------------------|
| TinyContract Deployment | ~100,000 gas | ~0.00001 ETH |
| TinyFactory Deployment | ~250,000 gas | ~0.000025 ETH |
| Factory deployContract() | ~120,000 gas | ~0.000012 ETH |
| TinyContract set() | ~30,000 gas | ~0.000003 ETH |

## Usage

1. Set up your environment variables:
   ```
   export PRIVATE_KEY=your_private_key
   ```

2. Deploy to Base mainnet:
   ```
   forge script script/DeployTinyContracts.s.sol:DeployTinyContracts --rpc-url https://mainnet.base.org --broadcast --verify
   ```

3. For local testing:
   ```
   forge script script/DeployTinyContracts.s.sol:DeployTinyContracts --fork-url https://mainnet.base.org
   ```

## Notes

- The contracts are intentionally minimal to reduce deployment costs
- All contracts use Solidity 0.8.20
- The deployment script simulates deploying 14 contracts (2 per day for 7 days)
- Each contract receives a transaction immediately after deployment for on-chain activity