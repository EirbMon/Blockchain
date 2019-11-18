var Eirbmon = artifacts.require("./Eirbmon.sol");
const fs = require('fs');

module.exports =  async (deployer, network, accounts) => {
  await deployer.deploy(Eirbmon);

  const metaDataFile = `${__dirname}/../build/contracts/Eirbmon.json`
  const metaData = require(metaDataFile)
  metaData.networks[deployer.network_id] = {}
  metaData.networks[deployer.network_id].address = Eirbmon.address
  fs.writeFileSync(metaDataFile, JSON.stringify(metaData, null, 4))
};