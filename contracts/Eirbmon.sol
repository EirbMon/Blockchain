pragma solidity ^0.5.8;

contract Eirbmon{

    struct _Eirbmon {
        uint id;
        string name;
        address owner;
        uint level;
        string field;
        string[2] atkList;
        uint hp;
    }

    string[4] private allName = ["roulade","petite bière","brasse","rattrapage"];
    uint[4] allNameWeight = [10,6,3,1]; // poids entre 1 et 10 avec 1=> très rare


    uint private eirbmonsCount = 0;

    mapping(uint => _Eirbmon) public _Eirbmons;

    constructor () public {
        addEirbmonToChain("pika",0x0000000000000000000000000000000000000000,"telecom","roulade","rattrapage",100);
    }

    // ajoute un Eirbmon à la chaine
    function  addEirbmonToChain(string memory name,address owner, string memory field, string memory atk1,string memory atk2, uint hp) public {
        eirbmonsCount++;
        _Eirbmons[eirbmonsCount] = _Eirbmon(eirbmonsCount,name,owner,0,field,[atk1,atk2],hp);
    }


    // renvoie le nombre d'Eirbmon total
    function getEirbmonCount() public view returns(uint)  {
        return eirbmonsCount;
    }


}