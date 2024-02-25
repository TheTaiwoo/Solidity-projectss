// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract todo{

    struct zara{
        string title;
        bool completed;
    }

    zara[] public list;

    function insert( string memory _title) public {

        list.push(zara(_title, false));
    }

    function update(uint index, string memory _title) public {
        list[index].title =_title;
    }



}