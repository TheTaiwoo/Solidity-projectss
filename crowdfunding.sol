// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address, uint) external returns (bool);

    function transferFrom(address, address, uint) external returns(bool);

}

contract crowdFunding {
    event Launch(
        uint id,
       address indexed creator,
       uint startAt,
        uint endAt,
        bool claimed
    );
    
    event Cancel(uint id);
    event Pledged(uint id, address indexed caller,uint amount);
    event Unpledged(uint id, address indexed caller, uint amount);
    event Claim(uint id);
    event Refund(uint id, address indexed caller, uint amount);

}

struct Campaign{
   address creator;
   string _title;
   uint goal;
   uint Pledged;
   uint startAt;
   uint endAt;
   bool Claimed;
}

IERC20 public immutable token;
uint public count;
mapping(uint => Campaign) public campaigns;
mapping(uint => mapping(address => uint)) public PledgedAmount;

constructor(address _token) {
    token = IERC20(_token);
}

function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
        require(_startAt >= block.timestamp, "startAt is less than now");
        require(_endAt >= _startAt, "endAt is less than startAt");
        require(_endAt <= block.timestamp + 20 minutes, "end at > max duration");
 
        count += 1;
        campaigns[count] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });
 
        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    }
 
    function cancel(uint _id) external {
        Campaign memory campaignStruct = campaigns[_id];
        require(campaignStruct.creator == msg.sender, "not creator");
        //you can only cancel a campaign when it has not started
        require(block.timestamp < campaignStruct.startAt, "started");
 
        delete campaigns[_id];
        emit Cancel(_id);
    }
 
    function pledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp >= campaign.startAt, "not started");
        require(block.timestamp <= campaign.endAt, "ended");
 
        campaign.pledged += _amount;
        pledgedAmount[_id][msg.sender] += _amount;
        token.transferFrom(msg.sender, address(this), _amount);
 //token.transferfrom(from, to, amount)
        emit Pledge(_id, msg.sender, _amount);
    }
 
    function unpledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "ended");
 
        campaign.pledged -= _amount;
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
 
        emit Unpledge(_id, msg.sender, _amount);
    }
 
    function claim(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!campaign.claimed, "claimed");
 //! not
        campaign.claimed = true; //update claim to true
        token.transfer(campaign.creator, campaign.pledged);
 //token.transfer(to, amount);
        emit Claim(_id);
    }
 
    function refund(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledged >= goal");
 
        uint bal = pledgedAmount[_id][msg.sender];
        bal = 0;
        token.transfer(msg.sender, bal);
 
        emit Refund(_id, msg.sender, bal);
    }


