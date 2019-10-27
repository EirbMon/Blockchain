var Eirbmon = artifacts.require("./Eirbmon.sol");
var pokeInstance;
it("initialises with two pokemons",function(){
    return Eirbmon.deployed().then(instance =>
                          instance.pokemonsCount()).
                          then(count => assert(count,2))

});

it("initialises with the pokemons with correct values",function(){
    return Eirbmon.deployed().then(instance =>{
                          pokeInstance = instance;
                          return pokeInstance.pokemons(1);}).
                          then(pokemon => {assert(pokemon[0],1);
                                           assert(pokemon[1],"Pika");
                                           assert(pokemon[2],0);
                                           return pokeInstance.pokemons(2);
                        }).then(pokemon=>{
                                            assert(pokemon[0],2);
                                           assert(pokemon[1],"Wartortle");
                                           assert(pokemon[2],0);
                                        })

});