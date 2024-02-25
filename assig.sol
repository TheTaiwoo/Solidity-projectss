// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract receiveEther{
    receive() external payable { }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract sendEther{

    receive() external payable { }

    function sendViaTransfer(address payable to, uint amount) public payable {
        to.transfer(amount);
    }
    function sendviasend(address payable _to) public payable{
        
    }
}