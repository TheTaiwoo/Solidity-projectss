// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Taiwo{
    address public owner;
    constructor(){
        owner = msg.sender;

    }
    modifier onlyOwner() {
        require (msg.sender ==owner, "not owner");
    _;
    }
    function setOwner (address _newOwner) external onlyOwner{
        require (_newOwner !=address(0), "invalid address");
        owner=_newOwner;

    }

}