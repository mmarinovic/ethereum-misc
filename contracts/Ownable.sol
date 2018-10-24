pragma solidity ^0.4.23;

contract Ownable {

    address public owner;

    event OwnerChanged(address indexed newOwner);

    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public {
        require(newOwner != owner);
        require(newOwner != address(0));

        owner = newOwner;

        emit OwnerChanged(newOwner);
    }
}