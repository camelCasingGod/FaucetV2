// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    uint public numOfFunders;
    address public owner;

    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    modifier limitWithdraw(uint withdrawAmount) {
        require(
            withdrawAmount <= 1000000000000000000,
            "Cannot withdraw more than 1 ether"
        );
        _; // function body is executed next
    }

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function"
        );
        _;
    }

    receive() external payable {}

    function addFunds() external payable {
        address funder = msg.sender;

        if (!funders[funder]) {
            uint index = numOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function admin1() external onlyOwner {
        // some managing stuff that only admin should have access to
    }

    function admin2() external onlyOwner {
        // some managing stuff that only admin should have access to
    }

    function withdraw(uint amount) external limitWithdraw(amount) {
        payable(msg.sender).transfer(amount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);
        for (uint8 n = 0; n < numOfFunders; n++) {
            _funders[n] = lutFunders[n];
        }
        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutFunders[index];
    }

    // const instance = await Faucet.deployed()
    
    // instance.addFunds({value: "2000000000000000000", from: accounts[0]})
    // instance.addFunds({value: "2000000000000000000", from: accounts[1]})

    // instance.getAllFunders()
    // instance.getFunderAtIndex(0)

    // instance.withdraw("500000000000000000", {from: accounts[1]})
}