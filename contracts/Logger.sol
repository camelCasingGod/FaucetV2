// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Any other contract inheriting from this contract
// must be implementing the methods specified here.

abstract contract Logger { // kind of like interface in java

    uint public testNum;

    constructor() {
        testNum = 1000;
    }

    function emitLog() public virtual returns(bytes32);

    function test3() external pure returns (uint) {
        return 100;
    }

}