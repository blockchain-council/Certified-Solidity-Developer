//versiona pragma
pragma solidity ^0.4.25; 

//import section

// filename.sol
import "filename";

// begin the contract
/// @title This is the layout of the solidity code
contract ContractName {
    /*
    * @title A Simple Layout Example
    * @author Toshendra Sharma
    * @notice Example for the Solidity Course
    * @dev This line is for developers only
    * 
    */

    // This is a single-line comment.

    /*
    This is a
    multi-line comment.
    */

    // State Variables
    address public stateVariable1;
    uint public stateVariable2;
    uint private stateVariable3;

    // Events
    event LogEvent1(address param1, uint param2);
    event LogEvent2(address param1);
    event LogEvent3();

    // Function Modifiers
    modifier onlyIfOwnerModifier() { 
        require (msg.sender == owner);
        _;
    }

    modifier onlyIfMortalModifier() { 
        require (msg.sender == mortal);
        _;
    }

    // Struct, arrays or Enum if any here
    enum enum1 { val1, val2, val3 }
    struct struct1 { 
        uint weight;
        uint height;
        address location;
    }
    mapping (address => uint) balances;


    // Define consutruct here
    constructor (uint initialCoins) public {
       // Initialize state variables here
    }

    /// @dev Comment for developers
    /// @param parameters details
    /// @return return variable details
    function function1(address param1, uint param2) public {
       //body of function here
       //logging an event
       emit LogEvent1(address param1, uint param2);
       //
       //
    }

    /// @dev Comment for developers
    /// @param parameters details
    /// @return return variable details
    function function2(address param1, uint param2) public {
       //body of function here
       //
       //
    }

    //default function
    function(){
        revert();
    }

}
