// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Election { 
    struct Candidate { 
        uint id; 
        string name; 
        uint voteCount; 
    } 
    
    mapping(address => bool) public voters; 
    mapping(uint => Candidate) public candidates; 
    uint public candidates_Count; 
    event votedEvent ( uint indexed _candidate_Id ); 
    
    constructor () public { 
        addCandidate("Narendra D Modi"); 
        addCandidate("Rahul Gandhi"); 
        addCandidate("Akhilesh Yadav"); 
        addCandidate("Mamta Banarjee"); 
        addCandidate("Mayavti"); 
        addCandidate("NOTA"); 
    } 
    
    function addCandidate (string memory name) private { 
        candidates_Count ++; 
        candidates[candidates_Count] = Candidate(candidates_Count, name, 0); 
    } 
    
    function vote (uint _candidate_Id) public { 
        require(!voters[msg.sender]); 
        require(_candidate_Id > 0 && _candidate_Id <= candidates_Count); 
        voters[msg.sender] = true; candidates[_candidate_Id].voteCount ++; 
        emit votedEvent(_candidate_Id); 
    } 
}