// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tee{

    function Jay() public view returns (address, uint,uint){

       address sender = msg.sender;
       
      uint timestamp= block.timestamp;
      uint blockNumber=block.number;
      return(sender, timestamp,blockNumber);

    }
    

}