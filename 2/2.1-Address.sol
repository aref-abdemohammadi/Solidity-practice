// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Address {

    // مقدار پیش فرض یک متغیر آدرس، آدرس صفر میباشد
    // 0x0000000000000000000000000000000000000000 ~ address(0)

    address public contractAdr;
    address public ownerAdr;


    constructor() {
        // فراخوانی کننده کانستراکتور یا همان دپلوی کننده کانترکت به عنوان مالک کانترکت محسوب می شود
        ownerAdr = msg.sender;
        contractAdr = address(this);
    }


    function payment() payable public {
        if(msg.value < 1 ether)
            revert("You need to pay 1 Eth");
    }


    function getContractBalance() public view returns (uint) {
        //return contractAdr.balance;               // wei
        return contractAdr.balance/10**18;         // Eth
    }


    function getOwnerBalance() public view returns (uint) {
        //return ownerAdr.balance;          // wei
        return ownerAdr.balance/10**18;     // Eth
    }


    function destructor() public {
        if(msg.sender == ownerAdr)
            selfdestruct(payable(ownerAdr));
        else
            revert("Only Owner can kill the contract!");
    }

}


    /*
        هر آدرسی در بلاکچین میتواند موجودی داشته باشد
        Address:
            1. Accounts
            2. Contracts

        1 ether = 10^18 wei = 1_000000_000000_000000 wei
        9 ether = 9 * 10^18 wei

        تمام متغیرهایی که مقادیر مالی را نشان میدهند باید از نوع
        uint256 ~ uint
    */



    /*
        -------------------
            متغیرهای عددی در سالیدیتی
        -------------------
        اعداد علامت دار - signed
        int8 - int16 - int32 - int64 - int128 - int256
        int ~ int256
        int8 : [0 , 2^8 - 1] ~ [0 , 255]


        اعداد بدون علامت - unsigned
        uint8 - uint16 - uint32 - uint64 - uint128 - uint256
        uint ~ uint256 : [0 , 2^256-1]
    */



    /*
        دو مقدار قابل خواندن داخل هر فانکشن سالیدیتی
            msg.sender : آدرس فراخوانی کننده فانکشن
            msg.value : مقداری که فراخوانی کننده تابع پرداخت کرده است
    */



    /*
            if(cond1) {
                اگر شرط برقرار بود
                TODO1;
            }
            else {
                اگر شرط برقرار نبود
                TODO2;
            }


            if(cond1) {
                TODO1;
            } else if (cond2) {
                TODO2;
            } else {
                TODO3;
            }


            Conditions ~ شرط ها
                a == b : مساوی                 
                a != b : نامساوی               
                a >= b : بزرگتر یا مساوی   
                a <= b : کوچکتر یا مساوی     

            
            ترکیب شرط ها
                if(cond1 && cond2 && .. ) :    دو شرط با هم درست باشند
                if(cond1 || cond2 || .. ) :    یکی از شرط های برقرار باشد
    */