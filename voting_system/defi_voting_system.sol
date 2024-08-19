// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {

    mapping(string => uint256) private Candidates;
    mapping(address => bool) public isVoted;
    mapping(string => bool) private candidateExists;
    string[5] private candidateNames;

    struct Candidate {
        string name;
        uint256 votes;
    }

    constructor() {
        Candidates['Google'] = 0;
        Candidates['Nvidia'] = 0;
        Candidates['OpenAi'] = 0;
        Candidates['Meta'] = 0;
        Candidates['Tata'] = 0;

        candidateExists['Google'] = true;
        candidateExists['Nvidia'] = true;
        candidateExists['OpenAi'] = true;
        candidateExists['Meta'] = true;
        candidateExists['Tata'] = true;

        candidateNames = ["Google", "Nvidia", "OpenAi", "Meta", "Tata"];
    }

    function getCandidates() public view returns (string[5] memory) {
        return candidateNames;
    }

    function show_All_Votes() public view returns (Candidate[] memory) {
        if (isVoted[msg.sender]) {
            Candidate[] memory allVotes = new Candidate[](candidateNames.length);
            for (uint i = 0; i < candidateNames.length; i++) {
                allVotes[i] = Candidate(candidateNames[i], Candidates[candidateNames[i]]);
            }
            return allVotes;
        } else {
            Candidate[]  memory emptyArray;
            return emptyArray;
        }
    }

    function giveVote(string memory can_name) public returns (string memory) {
        if (isVoted[msg.sender]) {
            revert("You Have Already Voted!");
        }

        if (!candidateExists[can_name]) {
            revert("There Is No Such Candidate!");
        }

        Candidates[can_name] += 1;
        isVoted[msg.sender] = true;

        return "Congratulations! You Have Successfully Voted!";
    }
}
