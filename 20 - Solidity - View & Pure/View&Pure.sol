//view
//constant is an alias to view.

pragma solidity ^0.4.25;

contract C {
    function f(uint a, uint b) public view returns (uint) {
        return a * (b + 42) + now;
    }
}

//pure
//Functions can be declared pure in which case they promise not to read from or modify the state.
pragma solidity ^0.4.25;

contract C {
    function f(uint a, uint b) public pure returns (uint) {
        return a * (b + 42);
    }
}
