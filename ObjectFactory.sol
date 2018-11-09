pragma solidity ^0.4.19;

contract ObjectFactory {

    event NewObject(uint objectId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Object {
        string name;
        uint dna;
    }

    Object[] public objects;

    function _createObject(string _name, uint _dna) private {
        uint id = objects.push(Object(_name, _dna)) - 1;
        emit NewObject(id, _name, _dna);
    }

    function _createRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomObject(string _name) public {
        uint randDna = _createRandomDna(_name);
        _createObject(_name, randDna);
    }
    
}
