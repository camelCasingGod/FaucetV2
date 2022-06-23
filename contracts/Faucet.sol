// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    receive() external payable {}

    function addFunds() external payable {}

    function justTesting() external pure returns(uint) {
        return 2 + 2;
    }

    // read-only calls, they will not need any gas fees
    // view - indicates that the function will not alter the storage state in any way
    // pure - even more strict, indicating that it won't even read the storage state

}