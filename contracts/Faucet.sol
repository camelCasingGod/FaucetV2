// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {

    receive() external payable {}

    function addFunds() external payable {}

    function justTesting() external pure {

    }

    // view - indicates that the function will not alter the storage state in any way
    // pure - even more strict, indicating that it won't even read the storage state

}