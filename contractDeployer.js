require('dotenv').config();
const Web3 = require('web3');

const privateKey = process.env.PRIVATE_KEY; 
console.log(privateKey)
const rpcUrl = 'https://ethereum-sepolia.core.chainstack.com/07cf9369e6ccb13a2ddacb25f511c28f'; 

const web3 = new Web3.Web3(rpcUrl)
console.log(web3.providers)
web3.eth.getBlockNumber()
  .then(blockNumber => {
    console.log('Current block number:', blockNumber);
  })
  .catch(error => {
    console.error('Error:', error);
  });