var Eirbmon = artifacts.require("./Eirbmon.sol");
var EirbmonInstance;
it("initialises with  1 free Eirbmon",function(){
    return Eirbmon.deployed().then(instance =>
                          instance.eirbmonsCount()).
                          then(count => assert.equal(count,1))});


it("initialises the _Eirbmon with correct adderss",function(){
    return Eirbmon.deployed().then(instance =>{
                          EirbmonInstance = instance;
                          return EirbmonInstance._Eirbmons(0);}).
                          then(_Eirbmon => {assert.equal(_Eirbmon[0],0);
                             assert.equal(_Eirbmon[2],'0x0000000000000000000000000000000000000000');
                     })
              })                         
                                        
 it("catch an Eirbmon",function(){
    Eirbmon.deployed().then(instance =>{
        instance.catchEirbmon(1,{from : '0x1000000000000000000000000000000000000000'});
        return instance}).then(instance=>
        assert.equal(instance._Eirbmons[1].owner,'0x1000000000000000000000000000000000000000'))
    })


it("generate an Eirbmon",function(){
    Eirbmon.deployed().then(instance =>{
        return instance.generateAnNewEirbmon();
    })
})
                                   


