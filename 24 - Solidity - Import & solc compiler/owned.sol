pragma solidity ^0.4.18;
contract owned {
    function owned() public { owner = msg.sender; }
    address owner;
}
