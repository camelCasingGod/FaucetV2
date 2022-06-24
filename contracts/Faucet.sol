// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    uint public numOfFunders;
    mapping(uint => address) private funders;

    // private -> can be accessible only within the smart contract
    // internal -> can be accessible within smart contract and also derived smart contract

    receive() external payable {}

    function addFunds() external payable {
        uint index = numOfFunders++;
        funders[index] = msg.sender;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return funders[index];
    }

}