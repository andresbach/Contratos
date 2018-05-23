pragma solidity ^0.4.18;

contract blockHash {
  //uint256 public lastHash;
	bytes32 public blockValue;
	uint256 public blockNumber;

  //event YES(string frase, uint256 cantidad);
  //event frase(string phrase);
	//event bloques(uint256 viejo, uint256 nuevo);

  function actualiza() public returns (uint256) {
		blockNumber = block.number;
    blockValue = blockhash(uint(blockNumber-4));

		//emit bloques(lastHash, blockValue);

    //if (lastHash == blockValue) {
      //revert();
			//emit frase("hasta aca llego");
			//return blockValue;
    //}

    //lastHash = blockValue;
	}
}
