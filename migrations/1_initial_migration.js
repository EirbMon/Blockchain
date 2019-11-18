var Migrations = artifacts.require("./Migrations.sol");
const fs = require('fs');

module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(Migrations);

  const metaDataFile = `${__dirname}/../build/contracts/Migrations.json`
  const metaData = require(metaDataFile)
  metaData.networks[deployer.network_id] = {}
  metaData.networks[deployer.network_id].address = Migrations.address
  fs.writeFileSync(metaDataFile, JSON.stringify(metaData, null, 4))
};