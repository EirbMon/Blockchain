module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "eirbmon.hopto.org", //mettre 127.0.0.1 en local
      port: 8545,
      network_id: "5999"// Match any network id
    },
    develop: {
      port: 9545
    }
  }
};
