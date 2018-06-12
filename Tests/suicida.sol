pragma solidity ^0.4.18;

contract suicida {
	address public owner;

	constructor() public {
		owner = msg.sender;
	}

	function balance() public returns (uint) {
		return this.balance();
	}

	function () public payable {
	}

  function matame() public {
		selfdestruct(owner);
	}
}
