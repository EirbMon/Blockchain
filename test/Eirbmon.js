var Eirbmon = artifacts.require("./Eirbmon.sol");
var EirbmonInstance;
it("initialises with  3 Eirbmons",function(){
    return Eirbmon.deployed().then(instance =>
                          instance.eirbmonsCount()).
                          then(count => assert.equal(count,3))});


it("initialises with the _Eirbmons with correct values",function(){
    return Eirbmon.deployed().then(instance =>{
                          EirbmonInstance = instance;
                          return EirbmonInstance._Eirbmons(0);}).
                          then(_Eirbmon => {assert.equal(_Eirbmon[0],0);
                            assert.equal(_Eirbmon[1],"Gribouille");
                            assert.equal(_Eirbmon[3],0);
                            return EirbmonInstance._Eirbmons(1);
                     })
                     
                      . then(_Eirbmon => {assert.equal(_Eirbmon[0],1);
                         assert.equal(_Eirbmon[1],"Artpick");
                         assert.equal(_Eirbmon[3],0);
                         return EirbmonInstance._Eirbmons(2);
                     })
                     .then(_Eirbmon=>{
                         assert.equal(_Eirbmon[0],2);
                        assert.equal(_Eirbmon[1],"Loustick");
                        assert.equal(_Eirbmon[3],0);
                     })
                
                })
                                        
                                        
                                        
 it("add an Eirbmon",function(){
     Eirbmon.deployed().then(instance =>{
         return instance.addEirbmon("pika");
     })
 })
                                   

<<<<<<< HEAD
//test in console
//Eirbmon.deployed().then(instance=>{app=instance;event = instance.SendEvent({},{fromBlock:0, toBlock:'latest'}).watch(function(err,event){console.log("event",event);})});web3.eth.getAccounts().then(A=>acc=A)
//Eirbmon.deployed().then(instance=>{app=instance;});web3.eth.getAccounts().then(A=>acc=A)
//
=======
// it("initialises with the pokemons with correct values",function(){
//     return Eirbmon.deployed().then(instance =>{
//                           pokeInstance = instance;
//                           return pokeInstance._Eirbmons(0);}).
//                           then(pokemon => {
//                             assert.equal(pokemon[0],0);
//                             assert.equal(pokemon[1],"Gribouille");
//                         })

// });
//test in console
//  Eirbmon.deployed().then(instance=>app=instance);web3.eth.getAccounts().then(A=>acc=A)
//  app.initAccount({from:acc[0] })
//  app._Eirbmons(1).then(a=>b=a)
// app.generateAnNewEirbmon('0x9ea17fa94c4ef95216bb1774a8ecd9d83be7a56f423bd74c217868eaa3c67fcb');
>>>>>>> parent of d802edd... Merge pull request #1 from EirbMon/dev
