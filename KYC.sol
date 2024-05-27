// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract KYC is Ownable {
    mapping(address => bool) public isKYCCompleted;
    mapping(address => bool) public isIndianResident;
    mapping(address => string) public aadharNumber;

    function completeKYC(address _user, string memory _aadharNumber) public onlyOwner {
        require(bytes(_aadharNumber).length == 12, "Invalid Aadhar number");
        // Mock Aadhar verification process
        isKYCCompleted[_user] = true;
        isIndianResident[_user] = true; // Assume that Aadhar verification implies Indian residency
        aadharNumber[_user] = _aadharNumber;
    }

    function revokeKYC(address _user) public onlyOwner {
        isKYCCompleted[_user] = false;
        isIndianResident[_user] = false;
        aadharNumber[_user] = "";
    }
}
