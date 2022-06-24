// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    uint public numOfFunders;
    mapping(address => bool) private funders;

    receive() external payable {}

    function addFunds() external payable {
        address funder = msg.sender;

        if (!funders[funder]) {
            numOfFunders++;
            funders[funder] = true;
        }
    }

    // function getAllFunders() external view returns (address[] memory) {
    //     address[] memory _funders = new address[](numOfFunders);
    //     for (uint8 n = 0; n < numOfFunders; n++) {
    //         _funders[n] = funders[n];
    //     }
    //     return _funders;
    // }

    // function getFunderAtIndex(uint8 index) external view returns (address) {
    //     return funders[index];
    // }

    // const instance = await Faucet.deployed()
    
    // instance.addFunds({value: "2000", from: accounts[0]})
    // instance.addFunds({value: "2000", from: accounts[1]})

    // instance.getAllFunders()
}