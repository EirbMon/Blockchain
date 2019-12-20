var Migrations = artifacts.require("./Migrations.sol");
const fs = require('fs');

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};

