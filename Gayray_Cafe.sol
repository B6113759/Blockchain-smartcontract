pragma solidity ^0.5.1;
//pragma experimental ABIEncoderV2;

contract ProofofGayray {  
    
  mapping (uint => string) private listName;
  mapping (uint => uint) private listTimestamp;
  mapping (uint => address) private listAddress;

  //---events---
  event NameAdded(
    address from,   
    string text,
    uint datetime,
    bytes32 hash
  );
  
  event RegistrationError(
    address from,
    string text,
    string reason
  );
  
  uint ordercount = 0;
    
  // store the proof for a student in the contract state
  function recordNameOrder(string memory name) private {
    listName[ordercount] = name;
  }
  
  function recordTimestampOrder(uint date) private {
    listTimestamp[ordercount] = date;
  }
  
  function recordAddressOrder(address addr) private {
    listAddress[ordercount] = addr;
  }
  
  // record a student name
  function registration(string memory name) public payable {
    if (msg.value != 0.02 ether && hashing(name) == hashing("MRE")) {
        emit RegistrationError(msg.sender, name, "ราคา MRE อยู่ที่ 0.02 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
    
    if (msg.value != 0.022 ether && hashing(name) == hashing("ต้มเล้ง")) {
        emit RegistrationError(msg.sender, name, "ราคา ต้มเล้ง อยู่ที่ 0.022 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
    
    if (msg.value != 0.012 ether && hashing(name) == hashing("เฉาก๊วยชากังราว")) {
        emit RegistrationError(msg.sender, name, "ราคา เฉาก๊วยชากังราว อยู่ที่ 0.012 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
    
    if (msg.value != 0.012 ether && hashing(name) == hashing("น้ำท่อม")) {
        emit RegistrationError(msg.sender, name, "ราคา น้ำท่อม อยู่ที่ 0.012 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
      
    if (msg.value != 0.012 ether && hashing(name) == hashing("ไมโล")) {
        emit RegistrationError(msg.sender, name, "ราคา ไมโล อยู่ที่ 0.012 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
    
    if (msg.value != 0.01 ether && hashing(name) == hashing("ชาชัก")) {
        emit RegistrationError(msg.sender, name, "ราคา ชาชัก อยู่ที่ 0.01 ETH");
        msg.sender.transfer(msg.value);
        return;
    }
    recordNameOrder(name);
    recordTimestampOrder(now);
    recordAddressOrder(msg.sender);
    ordercount++;
    
    //---fire the event---
    emit NameAdded(msg.sender, name, now,
        hashingOrder(name, now, msg.sender));
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  
  function hashingOrder(string memory name, uint timestamp, address addr) private 
  pure returns (bytes32) {
    return sha256(abi.encodePacked(name,timestamp,addr));
  }
  
  // get name of student in this class
  function getName(uint index) public view returns (string memory) {
    return listName[index];
  }
  
  // get name of student in this class
  function getTimestamp(uint index) public view returns (uint) {
    return listTimestamp[index];
  }
  
  // get name of student in this class
  function getAddress(uint index) public view returns (address) {
    return listAddress[index];
  }
  
  function getOrderLength() public view returns (uint) {
    return ordercount;
  }
}