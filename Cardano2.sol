pragma solidity ^0.4.0;
contract Cardano2 {
   uint256 public num = 1;
	 address public owner;
	 event checked(uint, address, uint);

	 constructor() {
		 owner = msg.sender;
	 }

    function setNum(uint256 _num) public {
				emit checked(num, msg.sender, _num);
				num = _num;
    }
}
