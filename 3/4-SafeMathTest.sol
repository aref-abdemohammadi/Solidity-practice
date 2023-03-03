// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "./4-SafeMathLibrary.sol";

// import "../Week2/4-SafeMathLibrary.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";


/*library SafeMath {

    function add(uint x, uint y) internal pure returns(uint) {
        uint z = x+y;
        require(z>=x, "overflow");
        return z;
    }
}*/


contract SafeMathTest {

    using SafeMath for uint;

    // روش اول - using
    function testAddV1(uint a, uint b) public pure returns(uint) {
        return a.add(b);    // return a+b;
    }

    // روش دوم
    function testAddV2(uint a, uint b) public pure returns(uint) {
        return SafeMath.add(a,b);    // return a+b;
    }
}