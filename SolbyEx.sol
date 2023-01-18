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
contract IterableMapping {
    mapping(address => uint256) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint256 _val) external {
        balances[_key] = _val;
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint256) {
        return keys.length;
    }

    function first() external view returns (uint256) {
        return balances[keys[0]];
    }

    function last() external view returns (uint256) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint256 _i) external view returns (uint256) {
        return balances[keys[_i]];
    }
}
