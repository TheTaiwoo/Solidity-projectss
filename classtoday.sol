// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Taiwo{

  uint[] public number=[1,2,3];
  function pushNumber() public {

    number.push(4);
  }

function update() public {
    number[1] = 77;
}
function remove() public {
 delete number[2];

}

}