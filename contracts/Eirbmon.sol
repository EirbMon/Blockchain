pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;


contract Eirbmon{

    struct _Eirbmon {
        uint id;
        string name;
        address owner;
        uint level;
        string field;
        string atk;
        uint hp;
    }

    string[] private allAtk = ["roulade","petite bière","brasse","rattrapage"];
    uint[] private allAtkWeight = [0xa,0x6,0x3,0x1]; // poids entre 1 et 10 avec 1=> très rare

    string[] private allField = ["RSI","SEE","Elec","Matmeca","Info","Telecom"];
    uint[] private allFieldWeight = [0xa,0x8,0x6,0x4,0x2,0x1]; // poids entre 1 et 10 avec 1=> très rare
 
    string[] private allName = ["nom1","nom2","nom3","nom4"];
    uint[] private allNameWeight = [0xa,0x6,0x3,0x1]; // poids entre 1 et 10 avec 1=> très rare

    uint private eirbmonsCount = 0;


    mapping(uint => _Eirbmon) public _Eirbmons;

    constructor () public {
        addEirbmonToChain("pika",0x0000000000000000000000000000000000000000,"telecom","roulade",100);
    }

    // ajoute un Eirbmon à la chaine
    function  addEirbmonToChain(string memory name,address owner, string memory field, string memory atk, uint hp) public {
        eirbmonsCount++;
        _Eirbmons[eirbmonsCount] = _Eirbmon(eirbmonsCount,name,owner,0,field,atk,hp);
    }
    

    // génère un nouvel Eirbmon random
    function generateAnNewEirbmon(uint bloc) public {
        // génère un nomnbre entre 1 et la somme des poids à partir des 44 premiers nombres hex du hash
        uint randAtkWeight = uint(uint(blockhash(block.number-bloc))/((0xf+1)**22))%sumArray(allAtkWeight)+1;
        string memory selectedAtk = getValueFromRand(allAtk,allAtkWeight,randAtkWeight);

        uint randFieldWeight = uint(uint(blockhash(block.number-bloc))/((0xf+1)**44))%sumArray(allFieldWeight);
        string memory selectedField = getValueFromRand(allField,allFieldWeight,randFieldWeight);

        uint randNameWeight = uint(uint(blockhash(block.number-bloc)))%sumArray(allNameWeight);
        string memory selectedName = getValueFromRand(allName,allNameWeight,randNameWeight);

        addEirbmonToChain(selectedName,0x0000000000000000000000000000000000000000,selectedField,selectedAtk,100);
    }

    // renvoie la valeur associé au nombre random passé en arguments en prenant en compte les poids de chaque valeur 
    function getValueFromRand(string[] memory valueArray,uint[] memory weightArray,uint randNameWeight) public pure returns(string memory) {
        uint sum = 0x0;
        for(uint i = 0;i < weightArray.length;i++){
            sum += weightArray[i];
            if(randNameWeight <= sum){
                return valueArray[i];
            }
        }
    }

    //Fait la somme de tous les éléments d'un tableau 
    function sumArray(uint[] memory _array) public pure returns(uint) {
        uint sum = 0x0;
         for(uint i;i < _array.length;i++){
            sum += _array[i];
        }
        return sum;
    }


    // renvoie le nombre d'Eirbmon total
    function getEirbmonCount() public view returns(uint)  {
        return eirbmonsCount;
    }


}


// lorsque le joueur commence, il a les choix entre 3 eirbmons, 
// lorsqu'il en choisit 1, il en devient le proprio et cela créé alors 1 nouvel Eirbmon
// qui dépend : du hash du block précédent, de l'adresse du joueur fois id de l'eirbmon modulo 10, et le 3e chiffre et la multi des 2 premiers modulo 10