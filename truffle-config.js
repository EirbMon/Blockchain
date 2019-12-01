module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "192.168.0.23", //mettre 127.0.0.1 en local
      port: 8545,
      network_id: "*", // Match any network id
      from:"0xa838a806D4BA343d88e1DFceF2af437F9F0880c4"
    },
    develop: {
      port: 8545
    }
  }
};
