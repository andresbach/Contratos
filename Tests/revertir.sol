pragma solidity ^0.4.18;

contract revertir {

  event frase(string phrase);

  function llamame(uint _num) public returns (uint) {

		emit frase("Checkpoint 1");

    if (_num == 8) {
			emit frase("Checkpoint 2");
			revert();
			emit frase("Checkpoint 3");
    }

		if (_num == 4) {
			emit frase("Checkpoint 2");
			require(1 == 2);
			emit frase("Checkpoint 3");
    }

		if (_num == 5) {
			emit frase("Checkpoint 2");
			assert(1 == 2);
			emit frase("Checkpoint 3");
		}

		if (_num == 6) {
			emit frase("Checkpoint 2");
			assert(1 == 1);
			emit frase("Checkpoint 3");
		}
		emit frase("Checkpoint 4");

		return _num;

	}
}
