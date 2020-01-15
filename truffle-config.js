module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "192.168.0.23", //mettre 127.0.0.1 en local
      port: 7545,
      network_id: "5777"// Match any network id
    },
    develop: {
      port: 9545
    }
  }
};
