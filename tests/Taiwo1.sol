// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tee{
    //Enum representing the shipping status
    enum status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    
    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    // update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    //To update a specific enum 
    function cancel() public {
        delete status;
    }
        }