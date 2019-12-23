pragma solidity ^0.5.8;
pragma experimental ABIEncoderV2;


contract Eirbmon{

    struct _Eirbmon {
        uint id;
        string name;
        address payable owner;
        uint evolve;
        string field;
        uint[3] atk;
        uint hp;
        uint canBeExhangedTo;
        uint price;
        bool canBeSelled;
        uint value;
        uint256 birthDate;
    }
    event SendEvent(string message);
 

    uint[] private allAtkWeight = [0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa]; // poids entre 1 et 10 avec 1=> très rare

    string[] private allField = ["RSI","SEE","Elec","Matmeca","Info","Telecom"];
    uint[] private allFieldWeight = [0xa,0x8,0x6,0x4,0x2,0x1]; // poids entre 1 et 10 avec 1=> très rare
    uint sumFieldWeight = 31;

    string[] private allName = ["Roucoul","Salameche","Carapuce","Pikachu"];
    uint[] private allNameWeight = [0xa,0x6,0x3,0x1]; // poids entre 1 et 10 avec 1=> très rare
    uint sumNameWeight = 20;

    uint public eirbmonsCount = 0;
    uint public registeredCount = 0;


    mapping(uint => _Eirbmon) public _Eirbmons;
    mapping(address => bool) public _registeredAccounts;

    constructor () public {
        addEirbmonToChain("Pikachu",msg.sender,"Telecom",1,2,3,100,19+30+10);
        addEirbmonToChain("Roucoul",msg.sender,"Info",1,2,3,100,0+28+10);
        generateAnNewEirbmon();
        generateAnNewEirbmon();
    }

    // ajoute un Eirbmon à la chaine
    function  addEirbmonToChain(string memory name,address payable owner, string memory field, uint atk1, uint atk2, uint atk3, uint hp,uint value) public {
        eirbmonsCount++;
        _Eirbmons[eirbmonsCount] = _Eirbmon(eirbmonsCount,name,owner,0,field,[atk1,atk2,atk3],hp,0,0,false,value,now);
   }
 
    function initAccount() public {
        require(!_registeredAccounts[msg.sender]);
        _registeredAccounts[msg.sender] = true;
        addEirbmonToChain("Roucoul",msg.sender,"RSI",1,2,3,40,0+0+4);
         generateAnNewEirbmon();
    }

    
    // génère un nouvel Eirbmon random
    function generateAnNewEirbmon() private {
        // génère un nombre entre 1 et la somme des poids à partir des 44 premiers nombres hex du hash
        // uint randAtkWeight = uint(uint(blockhash(block.number-1))/((0xf+1)**16))%sumArray(allAtkWeight)+1;
        // string memory selectedAtk = getValueFromRand(allAtk,allAtkWeight,randAtkWeight);

        uint atk1 = chooseAtk(uint(uint(blockhash(block.number-1))/((0xf+1)**5))%0x2D);
        uint atk2 = chooseAtk(uint(uint(blockhash(block.number-1))/((0xf+1)**10))%0x2D);
        uint atk3 = chooseAtk(uint(uint(blockhash(block.number-1))/((0xf+1)**16))%0x2D);

        uint randFieldWeight = uint(uint(blockhash(block.number-1))/((0xf+1)**32))%sumFieldWeight+1;
        uint selectedField = getValueFromRand(allFieldWeight,randFieldWeight);


        uint randNameWeight = uint(uint(blockhash(block.number-1))/((0xf+1)**48))%sumNameWeight+1;
        uint selectedName = getValueFromRand(allNameWeight,randNameWeight);

        uint randHp = uint(uint(blockhash(block.number-1))%0x8C + 10);


        uint value = atk1 + atk2 + atk3 + randHp/7 + sumNameWeight*(11-allNameWeight[selectedName])/10 + sumFieldWeight*(11-allFieldWeight[selectedField])/10;

        addEirbmonToChain(allName[selectedName],0x0000000000000000000000000000000000000000,allField[selectedField],atk1,atk2,atk3,randHp,value);
    }

    function chooseAtk(uint randNumber) private returns (uint){
            uint sum = 0x0;
            for(uint i = 0;i < 45;i++){
                sum += allAtkWeight[i];
                if(randNumber <= sum){
                    return i;
                }
            }
        }

    // renvoie la valeur associé au nombre random passé en arguments en prenant en compte les poids de chaque valeur 
    function getValueFromRand(uint[] memory weightArray,uint randNameWeight) public pure returns(uint) {
        uint sum = 0x0;
        for(uint i = 0;i < weightArray.length;i++){
            sum += weightArray[i];
            if(randNameWeight <= sum){
                return i;
            }
        }
    }


    // renvoie le nombre d'Eirbmon total
    function getEirbmonCount() public view returns(uint)  {
        return eirbmonsCount;
    }

    // renvoie les Eirbmons d'un compte
    //attention à ne pas utiliser cet appel dans les fonctions de type write.
    function getEirbmon(address owner) public view returns(_Eirbmon[] memory )  {
            require(_registeredAccounts[owner]);
            _Eirbmon[] memory ownerEirbmons;
            uint j = 0;
            for(uint i = 0; i < eirbmonsCount; i++){
               if(_Eirbmons[i].owner == owner){
                   ownerEirbmons[j] = _Eirbmons[i];
                   j++;
               }
            }
            return ownerEirbmons;
    }
    function getAtks(uint _eirbmonId) public view returns (uint[3] memory) {
        return _Eirbmons[_eirbmonId].atk;
    }

    function isExisted(uint _EirbmonId) public view returns (bool){
        return _EirbmonId<=eirbmonsCount;
    }
    function isOrphan(uint _EirbmonId) public view returns (bool){
        return _Eirbmons[_EirbmonId].owner == 0x0000000000000000000000000000000000000000;
    }
    
    function appropriateEirbmonToOwner(address payable owner,uint _EirbmonId) private {
            require (_registeredAccounts[owner],"Sender does not exist");
            _Eirbmons[_EirbmonId].owner = owner;
    }

    function catchEirbmon(uint _EirbmonId) public returns  (bytes32) {
            require(isExisted(_EirbmonId),"eirbmon does not exist");
            require(isOrphan(_EirbmonId),"the eirbmon you want is orphan");
            generateAnNewEirbmon();
            appropriateEirbmonToOwner(msg.sender,_EirbmonId);
            emit SendEvent("catched");
    }


     //Change the owner of an Eirbmon  
    function exchangeMyEirbmonTo(uint myEirbmonId,uint hisEirbmonId ) public {
         require (_registeredAccounts[msg.sender],"Sender does not exist");
         require (msg.sender == _Eirbmons[myEirbmonId].owner,"Sender is not the owner");
         require (!isOrphan(hisEirbmonId),"the eirbmon you want to exchange is orphan");
         //Si l'autre joueur a accepté de'échanger son eirbmon avec le 
         if(_Eirbmons[hisEirbmonId].canBeExhangedTo==myEirbmonId){
            _Eirbmons[hisEirbmonId].canBeExhangedTo = 0;
            changeEirbmons(myEirbmonId,hisEirbmonId);
        }
        //Sinon on est le premier à déclarer d'avoir accépter un échange d'eirbmons
        else{
           _Eirbmons[myEirbmonId].canBeExhangedTo = hisEirbmonId;
            }
    }

    // échanger les proprétaires des eirbmons
      function changeEirbmons(uint idEirbmon1,uint idEirbmon2) private {
            address payable owner1 = _Eirbmons[idEirbmon1].owner;
            _Eirbmons[idEirbmon1].owner = _Eirbmons[idEirbmon2].owner;
            _Eirbmons[idEirbmon2].owner = owner1;
    }
    // Changer le status pour que l'eirbmon peut étre vendu. 
      function ableSaleEirbmon(uint eirbmonId) public {
            require(isExisted(eirbmonId),"eirbmon does not exist");
            require (msg.sender == _Eirbmons[eirbmonId].owner,"Sender is not the owner");
            _Eirbmons[eirbmonId].canBeSelled = true;
            _Eirbmons[eirbmonId].price = getValue(eirbmonId);
    }

      function saleEirbmon(uint eirbmonId,uint price) public {
            ableSaleEirbmon(eirbmonId);
            _Eirbmons[eirbmonId].price = 1000000000000000000*price;
    }

      function byEirbmon(uint eirbmonId) public payable {
            require(_Eirbmons[eirbmonId].canBeSelled,"this eirbmon can't be selled");
            require(_Eirbmons[eirbmonId].owner!=msg.sender,"You can't bye your Eirbmon");
            require(_Eirbmons[eirbmonId].price < msg.value,"this eirbmon can't be selled");
            require (_registeredAccounts[msg.sender],"Sender does not exist");
           //transfer Ether
            _Eirbmons[eirbmonId].owner.transfer(_Eirbmons[eirbmonId].price);
            msg.sender.transfer(msg.value-_Eirbmons[eirbmonId].price);
            //transfer Eirbmon
            _Eirbmons[eirbmonId].owner = msg.sender;
            //reset Eirbmon fields
            _Eirbmons[eirbmonId].canBeSelled = false;
    }

    function getEirbmonAge (uint Id) public view returns(uint256 time){
        return block.timestamp - _Eirbmons[Id].birthDate;
    }
     
    function getAtk(uint id) public view returns(uint[3] memory)  {
        return _Eirbmons[id].atk;
    }

    function getValueFromWeight(uint sumArray,string[] memory valueArray,uint[] memory weightArray,string memory research ) public pure returns(uint) {
        for(uint i = 0;i < valueArray.length;i++){
            if(keccak256(abi.encodePacked(valueArray[i])) == keccak256(abi.encodePacked(research))){
                return sumArray*(11-weightArray[i])/10;
            }
        }
    }

    function getValue(uint _EirbmonId) public view returns(uint){
        return _Eirbmons[_EirbmonId].evolve*2 + _Eirbmons[_EirbmonId].atk[0] + _Eirbmons[_EirbmonId].atk[1] + _Eirbmons[_EirbmonId].atk[2]+ getValueFromWeight(sumNameWeight,allName,allNameWeight,_Eirbmons[_EirbmonId].name) + getValueFromWeight(sumFieldWeight,allField,allFieldWeight,_Eirbmons[_EirbmonId].field) + _Eirbmons[_EirbmonId].hp/7 ;
    }

      function evolveEirbmon(uint eirbmonId, string memory evolutionName) public {
            require(_Eirbmons[eirbmonId].owner==msg.sender,"The Eirbmon is not yours");
            _Eirbmons[eirbmonId].name = evolutionName;
            _Eirbmons[eirbmonId].evolve = _Eirbmons[eirbmonId].evolve + 1;
            _Eirbmons[eirbmonId].atk[1] = min(_Eirbmons[eirbmonId].atk[1] + 2,9);
            _Eirbmons[eirbmonId].atk[2] = min(_Eirbmons[eirbmonId].atk[2] + 2,9);
            _Eirbmons[eirbmonId].atk[0] = min(_Eirbmons[eirbmonId].atk[0] + 2,9);
            _Eirbmons[eirbmonId].hp = _Eirbmons[eirbmonId].hp + _Eirbmons[eirbmonId].evolve*40;
            _Eirbmons[eirbmonId].canBeExhangedTo = 0;
            _Eirbmons[eirbmonId].canBeSelled = false;
            _Eirbmons[eirbmonId].value = getValue(eirbmonId);

    }

       function min(uint a, uint b) private pure returns (uint) {
        return a < b ? a : b;
    }

}


// lorsque le joueur commence, il a les choix entre 3 eirbmons, 
// lorsqu'il en choisit 1, il en devient le proprio et cela créé alors 1 nouvel Eirbmon
// qui dépend : du hash du block précédent, de l'adresse du joueur fois id de l'eirbmon modulo 10, et le 3e chiffre et la multi des 2 premiers modulo 10
