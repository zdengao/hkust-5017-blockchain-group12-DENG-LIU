//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// we don't use this contract now, because frontend pages haven't been
// changed to connect with this contract.

contract NFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;
    address [] parents;

    constructor(address marketplaceAddress) ERC721("Metaverse Tokens","METT"){
        contractAddress = marketplaceAddress;
    }
    
    function createToken(string memory tokenURI, address [] memory parentAddress) public returns(uint){
        parents = parentAddress;
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        this.reward(msg.sender, 100000000000);
        return newItemId;
    }

    function reward(address creatorAddress, fixed value) public{
        require(value>100);
        for (uint i=0;i<parents.length;i++){
            NFT targetContract = NFT(parents[i]);
            targetContract.reward(creatorAddress,value*0.15);
            if(parents[i]!=creatorAddress){
                payable(parents[i]).transfer(uint(value));
            }
        } 
    }
}
