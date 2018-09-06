pragma solidity ^0.4.20;
contract TodoList {
	 address public owner;

	 constructor() public {
		 owner = msg.sender;
	 }

   struct Todo {
      uint256 id;
			string content;
			//bytes32 content;
      address owner;
      bool isCompleted;
      uint256 timestamp;
   }

   uint256 public constant maxAmountOfTodos = 5;

   // Owner => todos. Para cada direccion tengo un array de maxAmountOfTodos
   mapping(address => Todo[maxAmountOfTodos]) public todos;
   // Owner => last todo id. Esto es un contador de cuantas vengo haciendo con esa cuenta
   mapping(address => uint256) public lastIds;
	 // este es un bool para indicar que ya saturo el array y volvio a empezar
	 mapping(address => bool) public overIds;

   modifier onlyOwner(address _owner) {
      require(msg.sender == _owner);
      _;
   }
   // Add a todo to the list
	 function addTodo(string _content) public {
   //function addTodo(bytes32 _content) public {
      Todo memory myNote = Todo(lastIds[msg.sender], _content, msg.sender, false, now);
			// voy llenando el array en orden con lastIds
      todos[msg.sender][lastIds[msg.sender]] = myNote;
			// me fijo si llene el array o si todavia hay lugar para el siguiente ToDo. Si llegue al final del array, piso la entrada mas vieja
			//if(lastIds[msg.sender] >= maxAmountOfTodos) lastIds[msg.sender] = 0;
      if(lastIds[msg.sender] >= (maxAmountOfTodos - 1)) {
				lastIds[msg.sender] = 0;
				overIds[msg.sender] = true;
			}
      else lastIds[msg.sender]++;
   }
   // Mark a todo as completed.
   function markTodoAsCompleted(uint256 _todoId) public onlyOwner(todos[msg.sender][_todoId].owner) {
      require(_todoId < maxAmountOfTodos);
      require(!todos[msg.sender][_todoId].isCompleted);

      todos[msg.sender][_todoId].isCompleted = true;
   }

	 function matame() public {
		 require(msg.sender == owner);
		 selfdestruct(owner);
	 }
}
