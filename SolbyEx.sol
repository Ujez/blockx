// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// contract HelloWorld{
//     string public myString = "hello world";
// }

//FUNCTIONS

// contract Func{
//     function add(uint x, uint y) external pure returns (uint){
//         return x+y;
//     }
//     function sub(uint x, uint y) external pure returns (uint){
//         return x-y;
//     }
// }

// contract LocalVars{
//     //state vars persist
//     uint public i;
//     bool public b;
//     address public myAddress;
//     //while local vars only exist only when the fxn runs or is called
//     function foo() external{
//         uint x = 123;
//         bool f = false;

//         x += 456;
//         f = true;

//         i = 123;
//         b = true;
//         myAddress = address(1);
//     }
// }
// contract GlobalVars{
//     function globalVars() external view returns (address, uint, uint){
//         address sender = msg.sender;
//         uint timestamp = block.timestamp;
//         uint blockNum = block.number;
//         return (sender, timestamp, blockNum);
//     }
// }

//Errors
// contract Error {
//     function testRequire(uint _i) public pure{
//         require(_i <= 10, "i>10"); // if the input is <, throw "1 > 10"
//     }
//     function testRevert(uint _i) public pure{
//         if(_i <= 10){
//             revert("i>10"); // the revert is used mostly when you have nested ifs
//         }
//     }

//     uint public num = 123;
//     function testAssert() public view{
//         assert(num ==123);// assert to check for conditions that would always be true
//     }
// }

// contract FunctionModifiers{
//     bool public paused;
//     uint public count;

//     function setPaused(bool _paused) external {
//         paused = _paused;
//     }
//     modifier whenNotPaused(){
//         require(!paused, "paused");
//         _;
//     }
//     function inc() external whenNotPaused{
//         count += 1;
//     }
//     function dec() external whenNotPaused{
//         count -= 1;
//     }
//     modifier cap(uint _x){
//         require(_x < 100, "x >= 100");
//         _;
//     }
//      function incBy(uint _x) external whenNotPaused cap(_x){
//         count += _x;
//     }
//     modifier sandwich(){
//         //code here
//         count += 10;
//         _;
//         //more code
//         count *= 2;
//     }
//     function foo() external sandwich {
//         count += 1;
//     }
// }

// CONSTRUCTOR
// contract Constructor {
//     address public owner;
//     uint public x;

//     constructor(uint _x){
//         owner = msg.sender;
//         x = _x;
//     }
// }

//OWNABLE, you can assign a owner and only the current owner can do that

// contract Ownable {
//     address public owner;

//     constructor(){
//         owner = msg.sender;
//     }

//     modifier onlyOwner(){
//         require(msg.sender == owner, "not owner");
//         _;
//     }

//     function setOwner(address _newOwner) external onlyOwner{
//         require(_newOwner != address(0), "invalid address");
//         owner = _newOwner;
//     }

//     function onlyOwnerCanCallThisFunc() external onlyOwner{
//         //code
//     }

//     function anyOneCanCall() external {
//         //code
//     }
// }

// contract FunctionOutputs{
//     function returnMany() public pure returns (uint, bool){
//         return (1, true);
//     }
//      function named() public pure returns (uint x, bool b){
//         return (1, true);
//     }
//      function assigned() public pure returns (uint x, bool b){
//         x = 1;
//         b = true;
//     }
// }
// ARRAYS 285955 183297
// contract ArrayShift{
//     uint[] public arr;
//     function example() public {
//         arr = [1,2,3];
//         delete arr[1];
//     }

//     // [1,2,3]--remove(1)-->[1,3,3]--->[1,3]
//     // [1,2,3,4,5,6]--remove(2)-->[1,2,4,5,6,6]---->[1,2,4,5,6]
//     // [1]--remove(0)-->[1]--->[]
//     function remove(uint _index) public {
//         require(_index < arr.length, "index out of bound");
//         for(uint i = _index; i < arr.length - 1; i++){
//             arr[i] = arr[i + 1];
//         }
//         arr.pop();
//     }
//     function test() external {
//         arr = [1,2,3,4,5];
//         remove(2);
//         assert(arr[0]==1);
//         assert(arr[1]==2);
//         assert(arr[2]==4);
//         assert(arr[3]==5);
//         assert(arr.length == 4);

//         // arr = [1];
//         // remove(0);
//         // // []
//         // assert(arr.length == 0);
//     }

// }

// This a gas efficient way
// contract ArrayReplaceLast{
//     uint[] public arr;
//     //  [1,2,3,4]--remove(1)-->[1,4,3]
//     // [1,4,3]--remove(2)-->(1,4)
//     // [1,2,3]--remove(1)-->[1,3]

//         function remove(uint _index) public {
//         arr[_index] = arr[arr.length - 1];
//         arr.pop();
//     }
//     function test() external{
//         arr = [1,2,3,4];

//         remove(1);//  [1,4,3]
//         assert(arr.length == 3);
//         assert(arr[0]==1);
//         assert(arr[1]==4);
//         assert(arr[2]==3);

//         remove(2); // [1, 4]
//         assert(arr.length == 2);
//         assert(arr[0]==1);
//         assert(arr[1]==4);

//     }

// }
// contract IterableMapping {
//     mapping(address => uint256) public balances;
//     mapping(address => bool) public inserted;
//     address[] public keys;

//     function set(address _key, uint256 _val) external {
//         balances[_key] = _val;
//         if (!inserted[_key]) {
//             inserted[_key] = true;
//             keys.push(_key);
//         }
//     }

//     function getSize() external view returns (uint256) {
//         return keys.length;
//     }

//     function first() external view returns (uint256) {
//         return balances[keys[0]];
//     }

//     function last() external view returns (uint256) {
//         return balances[keys[keys.length - 1]];
//     }

//     function get(uint256 _i) external view returns (uint256) {
//         return balances[keys[_i]];
//     }
// }

// contract Structs {
//     struct Car {
//         string model;
//         uint256 year;
//         address owner;
//     }
//     Car public car; //using the struct as a state variable
//     Car[] public cars;
//     mapping(address => Car[]) public carsByOwner;

//     function examples() external {
//         Car memory toyota = Car("Toyota", 1990, msg.sender);
//         Car memory lambo = Car({
//             year: 1980,
//             model: "Lamborghini",
//             owner: msg.sender
//         });
//         Car memory tesla;
//         tesla.model = "Tesla";
//         tesla.year = 2010;
//         tesla.owner = msg.sender;

//         cars.push(toyota);
//         cars.push(lambo);
//         cars.push(tesla);

//         cars.push(Car("Ferrari", 2020, msg.sender));

//         Car storage _car = cars[0];
//         _car.year = 1999;
//         delete _car.owner;
//         delete cars[1];
//     }
// }

//USING ENUMS
// contract Enum{
//     enum Status{
//         None,
//         Pending,
//         Shipped,
//         Completed,
//         Rejected,
//         Canceled
//     }
//     Status public status;
//     struct Order{
//         address buyer;
//         Status status;
//     }
//     Order[] public orders;
//     function get() view external returns (Status) {
//         return status;
//     }
//     function set(Status _status) external {
//         status = _status;
//     }
//     function ship() external {
//         status = Status.Shipped;
//     }
//     function reset() external {
//         delete status;
//     }
// }

// contract TodoList{
//     struct Todo{
//         string text;
//         bool completed;
//     }
//     Todo[] public todos;
//     function create(string calldata _text) external {
//         todos.push(Todo({
//             text: _text,
//             completed: false
//         }));
//     }
//     function updateText(uint _index, string calldata _text) external {
//         // METHOD 1
//         // costlier if updating mmany fields opt for method 2, only use this when updating one field
//         todos[_index].text = _text;
//         // todos[_index].text = _text;
//         // todos[_index].text = _text;
//         // todos[_index].text = _text;
//         //METHOD 2
//         //much cheaper if you are updating more fields, opt for method 1 if updating just on field
//         // Todo storage todo = todos[_index];
//         // todo.text = _text;
//         // todo.text = _text;
//         // todo.text = _text;
//         // todo.text = _text;
//     }
//     function get(uint _index) view external  returns (string memory, bool){
//         Todo memory todo = todos[_index];
//         return (todo.text, todo.completed);
//     }
//     function toggleCompleted(uint _index) external {
//         todos[_index].completed = !todos[_index].completed;
//     }
// }
// contract Event {
//     event Log(string message, uint256 val);
//     event IndexedLog(address indexed sender, uint val);

//     function example() external {
//         emit Log("foo", 1234);
//         emit IndexedLog(msg.sender, 789);
//     }

//     event Message(address indexed _from, address indexed _to, string message);

//     function sendMessage(address _to, string calldata message) external {
//         emit Message(msg.sender, _to, message);
//     }
// }

// INHERITANCE

// contract S {
//     string public name;
//     constructor(string memory _name){
//         name = _name;
//     }
// }
// contract T {
//     string public text;
//     constructor(string memory _text){
//         text = _text;
//     }
// }
// contract U is S("s"), T("t"){

// }
// contract V is S, T{
//     constructor(string memory _name, string memory _text) S(_name) T(_text){

//     }
// }
// contract VV is S("s"), T{
//     constructor(string memory _text) T(_text){

//     }
// }

// //Order of execution
// //1. S
// //2. T
// //3. V1
// contract V0 is S, T{
//     constructor(string memory _name, string memory _text) S(_name) T(_text){

//     }
// }
// //Order of execution
// //1. T
// //2. S
// //3. V1
// contract V1 is T, S{
//     constructor(string memory _name, string memory _text) S(_name) T(_text){

//     }
// }

// VISIBILITY
// contract VisibilityBase {
//     uint private x = 0;
//     uint internal y = 1;
//     uint public z =2;
//     function privateFunc() private pure returns (uint256) {}

//     function internalFunc() private pure returns (uint256) {}

//     function publicFunc() private pure returns (uint256) {}

//     function externalFunc() private pure returns (uint256) {}

//     function examples() external view {
//         x + y + z;
//         privateFunc();
//         internalFunc();
//         publicFunc();

//         // this.externalFunc(); //this is a hacky trick so don't do it
//     }
// }

// contract VisibilityChild is VisibilityBase{
//     function examples2() external view {

//     }
// }

//IMMMUTABLES
// contract Immutable{
//     // gas 52576
//     address public immutable owner;

//     constructor(){
//         owner=msg.sender;
//     }
//     uint public x;
//     function foo() external {
//         require(msg.sender == owner);
//         x +=1;
//     }
// }

//contract Payable{
//    address payable public owner;
//    constructor ()  {
//        owner = payable(msg.sender);
//    }
//    function deposite() external payable {
//    }
//    function getbalance() external view returns(uint) {
//        return address(this).balance;
//    }
//}
//

// FALLBACK
// - Used when a fxn doesn't exist
// - Directly send ETH

//contract Fallback{
//    event Log(string func, address sender, uint value, bytes data);
//    fallback() external payable{
//        emit Log("fallback", msg.sender, msg.value, msg.data);
//    }
//    receive() external payable{
//        emit Log("recieve", msg.sender, msg.value, "");
//    }
//}
//
//contract SendEther{
//    constructor() payable {}
//    receive() external  payable {}
//
//    function sendViaTransfer(address payable _to) external payable{
//        _to.transfer(123);
//    }
//
//    function sendViaSend(address payable _to) external payable{
//        bool sent = _to.send(123);
//        require(sent, "send failed");
//    }
//
//    function sendViaCall(address payable _to) external payable{
//        (bool success, )=_to.call{value: 123}("");
//        require(success, "call failed");
//    }
//
//}
//
//contract EthReceiver{
//    event Log(uint amount, uint gas);
//
//    receive() external payable{
//        emit Log(msg.value, gasleft());
//    }
//}
//
//

//contract EtherWallet{
//    address payable public owner;
//    constructor(){
//        owner = payable(msg.sender);
//    }
//    receive() external payable{}
//
//    function withdraw(uint _amount) external {
//        require(msg.sender == owner, "caller is not owner");
//        payable(msg.sender).transfer(_amount);
//    }
//    function getBalance() external view returns (uint){
//        return address (this).balance;
//    }
//}
//

//contract Base { //    // Private function can only be called
//    // - inside this contract
//    // Contracts that inherit this contract cannot call this function.
//    function privateFunc() private pure returns (string memory) {
//        return "private function called";
//    }
//
//    function testPrivateFunc() public pure returns (string memory) {
//        return privateFunc();
//    }
//
//    // Internal function can be called
//    // - inside this contract
//    // - inside contracts that inherit this contract
//    function internalFunc() internal pure returns (string memory) {
//        return "internal function called";
//    }
//
//    function testInternalFunc() public pure virtual returns (string memory) {
//        return internalFunc();
//    }
//
//    // Public functions can be called
//    // - inside this contract
//    // - inside contracts that inherit this contract
//    // - by other contracts and accounts
//    function publicFunc() public pure returns (string memory) {
//        return "public function called";
//    }
//
//    // External functions can only be called
//    // - by other contracts and accounts
//    function externalFunc() external pure returns (string memory) {
//        return "external function called";
//    }
//
//    // This function will not compile since we're trying to call
//    // an external function here.
//    function testExternalFunc() public pure returns (string memory) {
//        return externalFunc();
//    }
//
//    // State variables
//    string private privateVar = "my private variable";
//    string internal internalVar = "my internal variable";
//    string public publicVar = "my public variable";
//    // State variables cannot be external so this code won't compile.
//    // string external externalVar = "my external variable";
//}
//
//contract Child is Base {
//    // Inherited contracts do not have access to private functions
//    // and state variables.
//function testPrivateFunc() public pure returns (string memory) {
//    return privateFunc();
//}
//
//    // Internal function call be called inside child contracts.
//    function testInternalFunc() public pure override returns (string memory) {
//        return internalFunc();
//    }
//}
//
//contract HelloWorld{
//    string public greet = "hello world";
//}
//contract Counter {
//     uint public counter; //
//     function get() public view returns(uint) {
//         return counter;
//     }
//     function inc() public {
//         counter += 1;
//     }
//     function dec() public {
//         counter -= 1;
//     }
//}

//contract Immutable {
//    address public immutable MY_ADDRESS;
//    uint public immutable MY_UINT;
//
//    constructor(uint _myUint){
//        MY_ADDRESS = msg.sender;
//        MY_UINT = _myUint;
//    }
//}
////contract SimpleStorage{
//    uint public  number;
//
//    function set(uint _number) public {
//       number = _number;
//    }
//    function get() public view returns(uint){
//        return number;
//
//}
//
contract Gas{
    uint public i = 0;

    function forever() public {
        while (true){
            i +=1;
        }
    }

}
