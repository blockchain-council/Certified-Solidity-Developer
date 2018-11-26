pragma solidity ^0.4.25; 

/*
* @title An Example for Solidity Course
* @author Toshendra Sharma
* @notice Example for the Solidity Course
*/

contract FunctionModifiers {

	address public creator;
    // Define consutruct here
    constructor() public {
       // Initialize state variables here
       creator = msg.sender;
    }

    modifier onlyCreator() {
        require (msg.sender == creator);
        _;
    }

    function kill() onlyCreator public { 
    	selfdestruct(creator);
    }

}
