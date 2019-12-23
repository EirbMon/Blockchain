var Eirbmon = artifacts.require("./Eirbmon.sol");
const fs = require('fs');

module.exports = function(deployer) {
  deployer.deploy(Eirbmon);
};