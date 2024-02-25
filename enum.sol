// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Shipping{

    enum Taiwo{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    Taiwo public Emma;

    function get() public view returns(Taiwo){
        return Emma;
    }
    
    function set(Taiwo _x) public{

    }

    function accepted() public{
        Emma = Taiwo.Accepted;
    }

    function reset() public {
        delete Emma;
    }

}