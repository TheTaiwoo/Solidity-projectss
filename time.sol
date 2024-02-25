// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract time{
   uint public Second = block.timestamp + 1 seconds;
   uint public Thirtysecond = block.timestamp + 30 seconds;
   uint public Minute = block.timestamp + 1 minutes;
   uint public Hour = block.timestamp + 1 hours;
   uint public startAt = block.timestamp + 2 minutes;
   uint public endAt = block.timestamp + 10 minutes;
}