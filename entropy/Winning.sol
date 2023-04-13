// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtheremonLite {
    function initMonster(string memory _monsterName) public {}
    function getName(address _monsterAddress) public view returns(string memory) {}
    function getNumWins(address _monsterAddress) public view returns(uint) {}
    function getNumLosses(address _monsterAddress) public view returns(uint) {}
    function battle() public returns(bool){}
}

contract WinBattle {

    // Placeholder; TODO for Q2
    address etheremonLiteAddress;
    EtheremonLite etheremonLiteInstance;

    constructor() {
        etheremonLiteAddress = address(0x04EAB7C83B2F45bDbE9DF44E337740bbdFe5efDE);
        etheremonLiteInstance = EtheremonLite(etheremonLiteAddress);
        etheremonLiteInstance.initMonster("ag2236");
    }

    function battle() public returns(bool) {
        /*
            In EthermonLite contract, battle ratio always has the value of 3, and we want
            the value of dice % battleratio to be zero, i.e. dice to be a multiple of 3
            dice itself is nothing but the half of the hash value of last block, thus we can write
            whenever the half of the hash value is a multiple of 3, our monster will always win
            i.e., (hash / 2 ) % 3 == 0 ==> hash % 6 == 0 
        */
        uint hash_of_last_block = uint(blockhash(block.number - 1));
        require((hash_of_last_block % 6) == 0, "See you next time, Ogre!");
        return etheremonLiteInstance.battle();
    }
}


