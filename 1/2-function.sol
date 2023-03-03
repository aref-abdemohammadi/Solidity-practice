// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract hello {

    string public hello_solidity ;

    constructor(){
        hello_solidity = "hello solidity";
    }

    function SetHello(string memory NewValue) public {
        hello_solidity = NewValue ;
    }

    function GetHello () public view returns (string memory){
        return hello_solidity;
    }

    function GetHello2() public view returns (string memory output){
        output = hello_solidity;
    }

    function GetHello3() public pure returns (string memory){
        string memory memoryVariable = "Output from memory variable";
        return memoryVariable;
    }

    function GetHello4() public returns (string memory){
        hello_solidity = "armo" ;
        return hello_solidity;
    }

    function GetHello5() public pure returns (string memory , string memory){
        string memory newStr1 = "welcome armo ";
        string memory newStr2 = "my name is armo";
        
        return (newStr1 , newStr2);
    }

    function GetHello6(string memory newStr1 , string memory newStr2) public pure returns (string memory , string memory){
        return(newStr1 , newStr2);
    }

}