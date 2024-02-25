// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Taiwo{
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner big head");
        _;
    }
    function setOwner(address _newOwner) public onlyOwner{
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }
    function onlyownercancall() public onlyOwner{

    }
    function anyonecancall() public {
        
    }
}