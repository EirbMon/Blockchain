module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
<<<<<<< HEAD
      host: "eirbmon.hopto.org", //mettre 127.0.0.1 en local
      port: 8545,
      network_id: "5900"// Match any network id
=======
      host: "0.0.0.0",
      port: 7545,
      network_id: "*" // Match any network id
>>>>>>> parent of d802edd... Merge pull request #1 from EirbMon/dev
    },
    develop: {
      port: 8545
    }
  }
};
