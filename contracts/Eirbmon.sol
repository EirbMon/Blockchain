pragma solidity ^0.5.8;

contract Eirbmon{

    struct Pokemon {
        uint id;
        string name;
        address account;
        int level;
    }
    uint public pokemonsCount = 0;
    mapping(uint => Pokemon) public pokemons;

    constructor() public{
        addPokemon("Pika");
        addPokemon("Wartortle");
    }
    function  addPokemon(string memory _name) public {
        pokemonsCount++;
        pokemons[pokemonsCount] = Pokemon(pokemonsCount,_name, msg.sender,0);
    }

    function get(uint i) public view returns (string memory)  {
        return pokemons[i].name;
    }
}