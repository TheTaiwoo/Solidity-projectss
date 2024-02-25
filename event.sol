// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tee{

event NameOfEvent(uint x, uint y, uint result);

function add(uint x, uint y) public returns (uint){
uint result = x + y;

emit NameOfEvent(x,y,result);
return result;

}

}