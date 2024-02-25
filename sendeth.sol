// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEther{
    receive() external payable { }

    function getBalance() public view returns(uint){
       return address(this).balance;
    }

}

contract sendEther{
    receive() external payable{ }

    function SendViaTransfer(address payable _to, uint amount) public payable{
        _to.transfer(amount);
    }
}