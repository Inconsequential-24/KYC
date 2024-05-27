// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./KYC.sol"; // Import the KYC contract

contract MySecurityToken is ERC20 {
    KYC public kycContract;

    constructor(address _kycAddress) ERC20("My Security Token", "MST") {
        kycContract = KYC(_kycAddress);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal view override {
        require(kycContract.isKYCCompleted(from), "Sender address not KYC verified");
        require(kycContract.isKYCCompleted(to), "Recipient address not KYC verified");
        require(kycContract.isIndianResident(from), "Sender is not an Indian resident");
        require(kycContract.isIndianResident(to), "Recipient is not an Indian resident");
        super._beforeTokenTransfer(from, to, amount);
    }
}
