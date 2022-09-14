pragma solidity >=0.4.0 <0.9.0;


contract Election {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );

    constructor () public {
        addCandidate("Bhartiya Janta Pary(BJP)");
        addCandidate("Congress(Cong)");
        addCandidate("Aam Aadmi Party(AAP)");
        addCandidate("Shiv Sena (SS)");
        addCandidate("Trinamool Congress(TMC)");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }
}
