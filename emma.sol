// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tee{

     mapping(address => uint) public userNumber;

     function setMyAmount(uint _amount) public{
        userNumber[msg.sender] = _amount;

     }

     function number() public view returns (uint){

        return userNumber[msg.sender];
     } 
     }