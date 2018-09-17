pragma solidity ^0.4.18;

contract CoinFlip {
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() public {
    consecutiveWins = 0;
  }

  event YES(string frase, uint256 cantidad);
  event NO(string frase);

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number-1));

    if (lastHash == blockValue) {
      //revert();
			// lo de abajo no estaba, tampoco el return
			emit NO("hasta aca llego");
			return false;
    }

    lastHash = blockValue;
    uint256 coinFlip = uint256(uint256(blockValue) / FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      emit YES("Bien! ", consecutiveWins);
      return true;
    } else {
      consecutiveWins = 0;
      emit NO("NO, desde cero!");
      return false;
    }
  }
}
