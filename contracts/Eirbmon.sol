pragma solidity ^0.5.8;

contract Eirbmon{

    struct _Eirbmon {
        uint id;
        string name;
        address account;
        uint level;
        string color;
        uint position_x;
        uint position_y;

    }

    uint public eirbmonsCount = 0;

    mapping(uint => _Eirbmon) public _Eirbmons;

    constructor () public {
        _Eirbmons[0].id = 0;
        _Eirbmons[0].name = "Pika";
        _Eirbmons[0].account = msg.sender;
        _Eirbmons[0].level = 0;
        _Eirbmons[0].color = "telecom";
        _Eirbmons[0].position_x = 10;
        _Eirbmons[0].position_y = 20;


        _Eirbmons[1].id = 1;
        _Eirbmons[1].name = "Sala";
        _Eirbmons[1].account = 0xB9a841c3E1988571d5129f3B1342960Bb15c4Dba;
        _Eirbmons[1].level = 0;
        _Eirbmons[1].color = "elec";
        _Eirbmons[1].position_x = 30;
        _Eirbmons[1].position_y = 20;

        eirbmonsCount = 2;
    }

   

    function get(uint i) public view returns (string memory)  {
        return _Eirbmons[i].name;
    }
}