// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Hello {

    string public helloStr = "Initial Value!";

    constructor() {
        helloStr = "Hello World!";
    }

    // عملکرد: مقدار جدیدی را در متغیر ذخیره میکند
    // برای نوشتن اطلاعات در بلاکچین باید هزینه پرداخت شود - Gas
    // Transaction in Web3:
    //  Hello.setHello("armo")
    function setHello(string memory newValue) public {
        helloStr = newValue;
    }


    // عملکرد: مقدار متغیر را اطلاع دهد
    // برای خواندن اطلاعات از بلاکچین هزینه ای نیاز نیست - مگر اینکه این کار توسط یک کانترکت اتفاق بیفتد
    // call by value
    // Call in Web3:
    // var result = Hello.getHello();
    function getHello() public view returns(string memory) {
        return helloStr;
    }


    // عملکرد: مقدار متغیر را اطلاع دهد
    // برای خواندن اطلاعات از بلاکچین هزینه ای نیاز نیست - مگر اینکه این کار توسط یک کانترکت اتفاق بیفتد
    // call by reference
    // Call in Web3:
    // var result = Hello.getHello();
    function getHello2() public view returns(string memory output) {
        output = helloStr;
    }


    function getHello3() public pure returns(string memory) {
        string memory memoryVariable = "Output from memory Variable!";
        return memoryVariable;
    }


    // گرفتن خروجی فقط در توابع ویو و پیور امکانپذیر است
    function getHello4() public returns(string memory) {
        helloStr = "Vahid";
        return helloStr;
    }


    // فانشکن میتواند بیش از یک مقدار را برگشت دهد
    function getHello5() public pure returns(string memory, string memory) {
        string memory newStr1 = "Welcome";
        string memory newStr2 = "to solidity";
        return (newStr1, newStr2);
    }

    function getHello5(string memory newStr1, string memory newStr2) public pure returns(string memory, string memory) {
        return (newStr1, newStr2);
    }
}



/*
    فانکشن های سالیدیتی

    function functionName(<input parameters>) <access modifier> <state mutability> returns(output types) {
        return <output variables>;
    }

*/



/*
    memory: در ورودی/خروجی/بدنه تابع  :  string , struct , array , mapping , bytes
    access modifier  : public , private , internal , external
    state mutability : pure , view
    memory types     : storage , memory , call_data/stack
*/


/*

Deploy SmartContract to BSC TestNet:

    1- install Metamsk on chrome:
        chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/home.html

        account: 0xC298bC3BC25FF922d985d8442260a87e18a41d36

    2- give faucet:
        https://testnet.binance.org/faucet-smart

        0xC298bC3BC25FF922d985d8442260a87e18a41d36 : 0.2 BNB

    3- add BSC Testnet to Metamask:
        RPC URL: https://data-seed-prebsc-1-s1.binance.org:8545
        ChainId: 97
        Currency Symbol: BNB
        Block Explorer URL: https://testnet.bscscan.com/

    4- connect remix Connect With MetaMask:
        Remix->Deploy->ENVIRONMENT->Injected Web3

    5- deploy contract:
        transaction hash:	0x31f4c8531a0dc37dc5ec8b22b13e1af7a9e53dd723fda3b04792dea61fff50eb
        contract address:   0xb0cf67def172cbe820a73474adb9b7266eefc119
                            https://testnet.bscscan.com/address/0xb0cf67def172cbe820a73474adb9b7266eefc119

    6- Verify contract:

    need to ABI:

    [
        {
            "inputs": [],
            "stateMutability": "nonpayable",
            "type": "constructor"
        },
        {
            "inputs": [],
            "name": "getHello",
            "outputs": [
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "helloStr",
            "outputs": [
                {
                    "internalType": "string",
                    "name": "",
                    "type": "string"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "string",
                    "name": "newValue",
                    "type": "string"
                }
            ],
            "name": "setHello",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ]
*/