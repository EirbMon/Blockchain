pragma solidity ^0.5.8;

contract Eirbmon{

    struct _Eirbmon {
        uint id;
        string name;
        address account;
        uint level;
        string color;
        string position_x;
        string position_y;
        string _type;
    }

    uint public eirbmonsCount = 0;

    mapping(uint => _Eirbmon) public _Eirbmons;

    constructor () public {
        _Eirbmons[0].id = 0;
        _Eirbmons[0].name = "Gribouille";
        _Eirbmons[0].account = msg.sender;
        _Eirbmons[0].level = 0;
        _Eirbmons[0].color = "Black";
        _Eirbmons[0].position_x = '-56.5';
        _Eirbmons[0].position_y = '3.6';
        _Eirbmons[0]._type = "Pikachu";



        _Eirbmons[1].id = 1;
        _Eirbmons[1].name = "Artpick";
        _Eirbmons[1].account = msg.sender;
        _Eirbmons[1].level = 0;
        _Eirbmons[1].color = "Silver";
        _Eirbmons[1].position_x = "-57.44";
        _Eirbmons[1].position_y = "3.7";
        _Eirbmons[1]._type = "Carapuce";

        _Eirbmons[2].id = 2;
        _Eirbmons[2].name = "Loustick";
        _Eirbmons[2].account = msg.sender;
        _Eirbmons[2].level = 0;
        _Eirbmons[2].color = "Purple";
        _Eirbmons[2].position_x = "-55.5";
        _Eirbmons[2].position_y = "3.6";
        _Eirbmons[2]._type = "Salameche";

        eirbmonsCount = 3;
    }

    // function  addPokemon(address account) private {
    //     _Eirbmons[eirbmonsCount].id = eirbmonsCount;
    //     _Eirbmons[eirbmonsCount].name = "dd";
    //     _Eirbmons[eirbmonsCount].account = account;
    //     _Eirbmons[eirbmonsCount].level = 0;
    //     _Eirbmons[eirbmonsCount].color = "elec";
    //     _Eirbmons[eirbmonsCount].position_x = 30;
    //     _Eirbmons[eirbmonsCount].position_y = 20; 
    //     eirbmonsCount++;
    // }

    function incEirbmonCount() public  {
        eirbmonsCount ++;
    }

    function getEirbmon(uint i) public view returns (string memory)  {
        return _Eirbmons[i].name;
    }
}