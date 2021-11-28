require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-ethers")
require("@nomiclabs/hardhat-truffle5")


/**require('dotenv').config()

const MAINNET_RPC_URL = process.env.MAINNET_RPC_URL || process.env.ALCHEMY_MAINNET_RPC_URL || "https://eth-mainnet.alchemyapi.io/v2/your-api-key"
const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL || "https://eth-rinkeby.alchemyapi.io/v2/your-api-key"
const KOVAN_RPC_URL = process.env.KOVAN_RPC_URL || "https://eth-kovan.alchemyapi.io/v2/your-api-key"
const MUMBAI_RPC_URL = process.env.MUMBAI_RPC_URL || "https://polygon-mumbai.alchemyapi.io/v2/your-api-key"
const POLYGON_MAINNET_RPC_URL = process.env.POLYGON_MAINNET_RPC_URL || "https://polygon-mainnet.alchemyapi.io/v2/your-api-key"
// optional
const PRIVATE_KEY = process.env.PRIVATE_KEY || "your private key"
*/

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            // // If you want to do some forking, uncomment this
            // forking: {
            //   url: MAINNET_RPC_URL
            // }
        },
        localhost: {
        },
       // kovan: {
           /// url: KOVAN_RPC_URL,
           //  accounts: [PRIVATE_KEY],
            //accounts: {
           //     mnemonic: MNEMONIC,
           // },
          //  saveDeployments: true,
       // },
       // rinkeby: {
           // url: RINKEBY_RPC_URL,
            // accounts: [PRIVATE_KEY],
          //  accounts: {
            //    mnemonic: MNEMONIC,
         //   },
//saveDeployments: true,
        //},
        
    },
    namedAccounts: {
        deployer: {
            default: 0, // here this will by default take the first account as deployer
            1: 0 // similarly on mainnet it will take the first account as deployer. Note though that depending on how hardhat network are configured, the account 0 on one network can be different than on another
        },
        feeCollector: {
            default: 1
        }
    },
    solidity: {
        compilers: [
            {
                version: "0.8.10"
            }
        ]
    },
    mocha: {
        timeout: 100000
    }
}