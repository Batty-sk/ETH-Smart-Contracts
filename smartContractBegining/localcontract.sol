pragma solidity ^0.8.0;

contract LocalContract{
    string private constant OWNER = "sk";
    struct FUNDERS{
        string name;
        uint ethDonated;
    }
    FUNDERS[] public funders;

    function whoIsOwner () public pure returns(string memory) {

            return OWNER;
    }

    function PayMe (string memory senderName) public payable{
        
        FUNDERS memory funder =  FUNDERS({
            name: senderName,
            ethDonated: msg.value
        });
        funders.push(funder);
    }

    function Funders () public view returns(FUNDERS[] memory){
        
        return funders;
    }

    
}