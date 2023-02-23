// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract fib {

    function get_fib (uint n) view public returns(uint){

    uint i = 2 ;
    uint a = 0 ;
    uint b = 1 ;
    uint show = 0 ;

        while (i <= n) {
            show = a+b ;
            a = b;
            b = show ;
            i ++ ;
        }
        return show;
        
    }
}