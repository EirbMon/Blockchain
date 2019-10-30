var Eirbmon = artifacts.require("./Eirbmon.sol");

it("add an Eirbmon",function(){
    Eirbmon.deployed().then(instance =>{
        return instance.addPokemon(0x764ea9a27E66839b204D08D743F4B55538FfAc50);
    })
});


