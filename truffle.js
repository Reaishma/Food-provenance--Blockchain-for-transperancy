module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 6721975,
      gasPrice: 20000000000,
    },
    ganache: {
      host: "127.0.0.1", 
      port: 8545,
      network_id: "*",
      gas: 6721975,
      gasPrice: 20000000000,
    },
    ropsten: {
      // provider: () => new HDWalletProvider(mnemonic, `https://ropsten.infura.io/v3/${infuraKey}`),
      network_id: 3,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    }
  },
  
  mocha: {
    // timeout: 100000
  },

  compilers: {
    solc: {
      version: "0.8.19",
      docker: false,
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        },
        evmVersion: "byzantium"
      }
    }
  },

  db: {
    enabled: false
  },

  contracts_directory: "./contracts",
  contracts_build_directory: "./build/contracts"
};