// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {
  //Modela Candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }
  //Store accounts that voted
  mapping (address=>bool) voters;
  //Store Candidate
  mapping (uint=>Candidate) public candidates;
  //Fetch Candidate
  //Store Candidate Count
  uint public candidatesCount;

  //voted event
  event votedEvent (
    uint indexed _candidateId
  );


  constructor() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string memory _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote(uint _candidateId) public {
    // require that they haven't voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    //update candidate vote count
    candidates[_candidateId].voteCount++;

    //trigger voted event
    emit votedEvent(_candidateId);
  }

  function showVoter(address _address) public view returns(bool) {
    return voters[_address];
  }


}