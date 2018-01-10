pragma solidity ^0.4.18;

    /*
    * @title A Simple Subcurrency Example
    * @author Toshendra Sharma
    * @notice Example for the Solidity Course
    * @dev This is only for demo the simple Coin example
    * 
    */

contract Sharer {
    function sendHalf(address addr) public payable returns (uint balance) {
        require(msg.value % 2 == 0); // Only allow even numbers
        uint balanceBeforeTransfer = this.balance;
        addr.transfer(msg.value / 2);
        // Since transfer throws an exception on failure and
        // cannot call back here, there should be no way for us to
        // still have half of the money.
        assert(this.balance == balanceBeforeTransfer - msg.value / 2);
        return this.balance;
    }
}

// Currently, Solidity automatically generates a runtime exception in the following situations:

// An assert-style exception is generated in the following situations:

// If you access an array at a too large or negative index (i.e. x[i] where i >= x.length or i < 0).
// If you access a fixed-length bytesN at a too large or negative index.
// If you divide or modulo by zero (e.g. 5 / 0 or 23 % 0).
// If you shift by a negative amount.
// If you convert a value too big or negative into an enum type.
// If you call a zero-initialized variable of internal function type.
// If you call assert with an argument that evaluates to false.

// A require-style exception is generated in the following situations:

// Calling throw.
// Calling require with an argument that evaluates to false.
// If you call a function via a message call but it does not finish properly (i.e. it runs out of gas, has no matching function, or throws an exception itself), except when a low level operation call, send, delegatecall or callcode is used. The low level operations never throw exceptions but indicate failures by returning false.
// If you create a contract using the new keyword but the contract creation does not finish properly (see above for the definition of “not finish properly”).
// If you perform an external function call targeting a contract that contains no code.
// If your contract receives Ether via a public function without payable modifier (including the constructor and the fallback function).
// If your contract receives Ether via a public getter function.
// If a .transfer() fails.

 // A revert operation causes the EVM to revert all changes made to the state.
