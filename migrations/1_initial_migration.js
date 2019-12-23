var Migrations = artifacts.require("./Migrations.sol");

<<<<<<< HEAD
module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
=======
module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(Migrations);

  const metaDataFile = `${__dirname}/../build/contracts/Migrations.json`
  const metaData = require(metaDataFile)
  metaData.networks[deployer.network_id] = {}
  metaData.networks[deployer.network_id].address = Migrations.address
  fs.writeFileSync(metaDataFile, JSON.stringify(metaData, null, 4))
};
>>>>>>> parent of d802edd... Merge pull request #1 from EirbMon/dev
