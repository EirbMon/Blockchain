const express = require('express');
const app = express();
const port = 4000 || process.env.PORT;
const Web3 = require('web3');
const truffle_connect = require('./connection/app.js');
const bodyParser = require('body-parser');
const contract = require('truffle-contract');
const eirbmon_artifact = require('./build/contracts/Eirbmon.json');
var Eirbmon = contract(eirbmon_artifact);
var cors = require('cors');

// Then use it before your routes are set up:
app.use(cors());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

app.use('/', express.static('src'));

// renvoi tout les comptes
app.get('/getAccounts', (req, res) => {
  console.log("**** GET /getAccounts ****");
  truffle_connect.start(function (answer) {
    res.send(answer);
  })
});

// afficher mes eirbmon
app.get('/getMyEirbmon', (req, res) => {
  console.log("**** GET /getMyEirbmon ****");
  truffle_connect.getMyEirbmon(req.query.address,function (answer) {
    res.send(answer);
  })
});

// renvoie Eirbmon.json
app.get('/Eirbmon.json', (req, res) => {
  res.send(eirbmon_artifact)
 });

app.listen(port, () => {

  // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
  truffle_connect.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:7545"));

  console.log("Express Listening at http://localhost:" + port);

});
