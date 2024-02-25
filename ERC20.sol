// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address receipent, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns(uint);
    function approve(address spender, uint amount) external returns(bool);
    function transferFrom(address sender, address receipent, uint amount)
    external returns(bool);

    event Transfer(address indexed from, address to, uint value);
    event Approval(address indexed owner, address spender, uint value);
    
}

contract ERC20 is IERC20{
    uint public override totalSupply;
    mapping(address=>uint) public override balanceOf;
    mapping(address => mapping(address => uint)) public override allowance;
    string public name = "TAIWO TOKEN";
    string public symbol = "TEE";
    uint public decimal = 18;

    function transfer (address recepient, uint amount) external override returns(bool){
        balanceOf [msg.sender] -= amount;
        balanceOf [recepient] += amount;

        emit Transfer (msg.sender, recepient, amount);
        return true;
    }
    function approve(address spender, uint amount)
    external override returns (bool){
        allowance[msg.sender][spender] = amount;
        //balanceOf[sender] = balanceOf[sender] - amount; another method
        //balanceOf[recipient]= balanceOf[recipient]+amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function transferFrom(address sender, address recepient, uint amount)external override returns(bool){
        //Remember, this transferFrom function will be called by the recepient
        //deduct the allowance you were given.
        allowance[sender][msg.sender]-=amount;
        //remove the amount from the sender"s account
        balanceOf[sender]-= amount;
        //credit the recepient with the amount deducted above
        balanceOf[recepient]+= amount;
        //Let the frontend know a transaction has occurred
        emit Transfer(sender, recepient, amount);
        return  true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -=amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}