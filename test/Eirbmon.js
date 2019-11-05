var Eirbmon = artifacts.require("./Eirbmon.sol");
var pokeInstance;

it("d",function(){
    return Eirbmon.deployed().then(instance =>{
        for (let index = 0; index < 100; index++) {
            instance.generateAnNewEirbmon(index).then(count => console.log(count))
        }
        })                      

});
// it("initialises with two pokemons",function(){
//     return Eirbmon.deployed().then(instance =>
//                           instance.eirbmonsCount()).
//                           then(count => assert(count,3))

// });

// it("initialises with the pokemons with correct values",function(){
//     return Eirbmon.deployed().then(instance =>{
//                           pokeInstance = instance;
//                           return pokeInstance._Eirbmons(0);}).
//                           then(pokemon => {
//                             assert.equal(pokemon[0],0);
//                             assert.equal(pokemon[1],"Gribouille");
//                         })

// });