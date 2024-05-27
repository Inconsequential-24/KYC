# KYC
Implementing KYC Using Blockchain 

# KYC and SecurityToken Smart Contracts

This project consists of two smart contracts: `KYC` for Know Your Customer (KYC) verification, and `SecurityTokenContract`, an ERC-20 token that only allows transfers between KYC-verified Indian residents.

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Contracts](#contracts)
  - [KYC](#kyc)
  - [SecurityTokenContract](#mysecuritytoken)
- [Deployment](#deployment)
- [Interacting with the Contracts](#interacting-with-the-contracts)
  - [Completing KYC](#completing-kyc)
  - [Transferring Tokens](#transferring-tokens)
- [Notes](#notes)
- [License](#license)

## Overview
The `KYC` contract handles the verification of users based on their Aadhar number and ensures they are Indian residents. The `MySecurityToken` contract is an ERC-20 token that restricts transfers to users who have completed the KYC process and are verified as Indian residents.

## Prerequisites
- [Remix IDE](https://remix.ethereum.org/)
- Ethereum wallet (e.g., MetaMask) for deploying contracts on a test network or mainnet
- Knowledge of Solidity and smart contract development

## Getting Started
Follow these steps to deploy and interact with the smart contracts using Remix IDE.

## Contracts
### KYC
The `KYC` contract is responsible for verifying users.

#### Functions
- `completeKYC(address _user, string memory _aadharNumber)`: Completes the KYC process for the given user with their Aadhar number.
- `revokeKYC(address _user)`: Revokes the KYC status of the given user.

### MySecurityToken
The `SecurityTokenContract` contract is an ERC-20 token that only allows transfers between KYC-verified Indian residents.

#### Functions
- Standard ERC-20 functions like `transfer`, `balanceOf`, `approve`, etc.
- `_beforeTokenTransfer(address from, address to, uint256 amount)`: Internal function to check KYC status before transferring tokens.

## Deployment
### Step 1: Compile the Contracts
1. Open Remix IDE at [Remix Ethereum IDE](https://remix.ethereum.org/).
2. Create a new file named `KYC.sol` and paste the `KYC` contract code.
3. Create another file named `MySecurityToken.sol` and paste the `MySecurityToken` contract code.
4. Compile both contracts using Solidity compiler version 0.8.0 or higher.

### Step 2: Deploy the KYC Contract
1. Go to the "Deploy & Run Transactions" tab.
2. Select the `KYC` contract from the dropdown.
3. Click "Deploy".
4. Copy the deployed contract address.

### Step 3: Deploy the MySecurityToken Contract
1. Select the `SecurityTokenContract` contract from the dropdown.
2. Paste the `KYC` contract address in the `_kycAddress` field.
3. Click "Deploy".

## Interacting with the Contracts
### Completing KYC
1. Expand the deployed `KYC` contract in Remix.
2. Locate the `completeKYC` function.
3. Enter the user's address and a 12-digit Aadhar number.
4. Click "transact" to complete the KYC for that user.

### Transferring Tokens
1. Expand the deployed `SecurityTokenContract` contract in Remix.
2. Mint some tokens to a KYC-approved user if needed.
3. Locate the `transfer` function.
4. Enter the recipient's address and the amount of tokens to transfer.
5. Ensure both sender and recipient have completed KYC and are Indian residents.
6. Click "transact" to transfer tokens.

## Notes
- The Aadhar verification in the `KYC` contract is a mock implementation. In a real-world scenario, integrate with an authorized Aadhar verification API.
- Ensure compliance with Indian laws regarding the handling and storage of Aadhar data.
- Implement appropriate security measures to protect user data.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
