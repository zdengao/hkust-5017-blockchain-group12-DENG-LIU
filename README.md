# HKUST-5017-blockchain Project-Artport NFT market

This project is based on Hardhat frame. It includes the contracts and web pages.

Our github project url is:
https://github.com/zdengao/hkust-5017-blockchain-group12-DENG-LIU

# Running
For local running, you should firstly run following commands:

```shell
npx hardhat node
```
Import one of the private key into the your wallet.

And next:

```shell
npx hardhat run scripts/deploy.js --network localhost
npm run dev
```

Then you could open the home page and do some transactions.

#

For testnet running, we already deploy our contracts into the testnet.

You could just run following commend:

```shell
npm run dev
```
 
Then open the web pages.

For reference those two contracts addresses are:

nftaddress = "0x71C95911E9a5D330f4D621842EC243EE1343292e"

nftmarketaddress = "0x8464135c8F25Da09e49BC8782676a84730C318bC"