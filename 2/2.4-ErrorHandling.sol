// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract ErrorHandling {

    uint8 public num = 100;     // [0 - 2^8-1] ~ [0-255]

    // Overflow - خطای سرریز
    // وقتی در متغیری یک مقدار بزرگتر از ظرفیت قرار دهیم خطایی به نام سرریز رخ می دهد
    // کامپایلر نسخه 8 به بعد این خطا را تشخیص داده و مدیریت میکنند
    // بنابراین در نسخه های جدید کاربر نیازی به کنترل سرریز ندارد


    function incrementV1(uint8 val) public {

        uint8 oldNum = num;

        // انجام عمل جمع
        num = num + val;        // num:100 + 200  --> Overflow --> num:300-256 = 44

        // بررسی وقوع سرریز
        if(num < oldNum)
            // Overflow
            // کنسل کردن تراکنش - تمام شرایط و مقادیر کانترکت به حالت قبل بر 
            revert("Overflow Occured!");
    }


    function incrementV2(uint8 val) public {

        uint8 oldNum = num;

        // انجام عمل جمع
        num = num + val;        // num:100 + 200  --> Overflow --> num:300-256 = 44

        // بررسی وقوع سرریز
        // کنسل کردن تراکنش - تمام شرایط و مقادیر کانترکت به حالت قبل بر 
        assert(num >= oldNum);
    }


    function incrementV3(uint8 val) public {

        // بررسی وقوع سرریز
        // کنسل کردن تراکنش - تمام شرایط و مقادیر کانترکت به حالت قبل بر 
        require(num + val >= num, "Overflow Occured!");

        // انجام عمل جمع
        num = num + val;
    }


    modifier checkOverflow(uint8 val) {
        // بررسی وقوع سرریز
        // کنسل کردن تراکنش - تمام شرایط و مقادیر کانترکت به حالت قبل بر 
        require(num + val >= num, "Overflow Occured!");
        
        _;  // placeholder ~ function_Body
    }


    function incrementV4(uint8 val) public checkOverflow(val) {
        
        // عملیات پر هزینه / مصرف گس بالا
        // require(num + val >= num, "Overflow Occured!");

        // انجام عمل جمع
        num = num + val;
    }

}



/*
    Error Handling ~ مدیریت خطا
        if(condition)    -->   revert("error message")
        assert(condition)
        require(condition, "error message")
        modifier
        
        Debug ~ اشکال یابی
            event
            hardhat -> console
*/