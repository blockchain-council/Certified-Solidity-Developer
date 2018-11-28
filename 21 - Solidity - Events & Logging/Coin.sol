pragma solidity ^0.4.25;

contract Coin {
    /*
    * @title A Simple Subcurrency Example
    * @author Toshendra Sharma
    * @notice Example for the Solidity Course
    * @dev This is only for demo the simple Coin example
    * 
    */
    mapping (address => uint256) public balanceOf;
    // balanceOf[address] = 5;
    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address _to, uint256 _value) public {
		require(balanceOf[msg.sender] > _value) ;
        balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
		emit Transfer(msg.sender, _to, _value);
	}
}
