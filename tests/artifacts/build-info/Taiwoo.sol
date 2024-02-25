// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tee {
    constructor()public {
        owner = msg.sender;

    }

    function deposit () public payable {

    }
        function getBalance () public view returns (uint){
            return address (this).balance;
        
        }
    }