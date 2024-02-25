// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract money{

    /*function sendViaSend(address payable _to, uint amount) public payable {

        bool sent= _to.send(amount);
        // the reason you use amount instead of msg.value is so that the user can choose
        // the amount he wants 
        //send rather than using msg.value which means you will be sending all the money you have

        require(sent, "failed to send ether");
        */

        function viaSendCall(address payable _to, uint amount) public payable {
        (bool sent, bytes memory data)=_to.call{value:amount}("");
        }
    }