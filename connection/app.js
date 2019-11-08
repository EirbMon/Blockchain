const Web3 = require('web3');
const contract = require('truffle-contract');
const eirbmon_artifact = require('../build/contracts/Eirbmon.json');
var Eirbmon = contract(eirbmon_artifact);

  function start (callback) {
    var self = this;
    // Bootstrap the Eirbmon abstraction for Use.
      Eirbmon.setProvider(web3.currentProvider);

    web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        console.log(account);
      }else{
        console.log("account");

      }
    });
    // Get the initial account balance so it can be displayed.
    web3.eth.getAccounts(function(err, accs) {
      if (err != null) {
        console.log("There was an error fetching your accounts.");
        return;
      }

      if (accs.length == 0) {
        console.log("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
        return;
      }
      self.accounts = accs;
      self.account = self.accounts[2];
      console.log(self.accounts);
      callback(self.accounts);
    });
  }; 

  function initEirbmon (acc) {
    // Bootstrap the Eirbmon abstraction for Use.
    Eirbmon.setProvider(web3.currentProvider);
    console.log("here");
    // if (typeof Eirbmon.currentProvider.sendAsync !== "function") {
    //   Eirbmon.currentProvider.sendAsync = function() {
    //     return Eirbmon.currentProvider.send.apply(
    //       Eirbmon.currentProvider,
    //           arguments
    //     );
    //   };
    // }
    Eirbmon.deployed().then(function(instance) {app = instance});

    Eirbmon.deployed().then(function(instance) {
     app = instance;
     app._Eirbmons(1).then(x=>console.log(console.log("Eirbmons[1] : " + x)))  
   return app; }).then((app)=>{
      try{
      //  app.initAccount({from : acc[7],gas:3000000});
    //    app.getEirbmon().then(x=>console.log(x));
        }catch(error){console.log("hello")} //      app.initAccount({from : acc[1]});
     //    app.initAccount({from : acc[3]});
     return app;
    })
   
  }
  const web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545"));
  start(accounts=>initEirbmon(accounts));

