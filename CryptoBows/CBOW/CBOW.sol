// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";
import "./Ownable.sol";

contract CBOW is ERC20, Ownable {
    uint256 public maxSupply = 100000000 ether;

    mapping(address => bool) public allowedAddresses;

    address rewardPoolAddress = 0xb814D6165aC389F50411E6FA6946A76C0008C0c0;
    address marketingAddress = 0x22294F18820C6c0158Beb4A64990A96d855E9C25;
    address liquidityAddress = 0x57dfd7A3D7AC479a11F139445D92F5438F5E03b4;
    address teamAddress = 0x7276823580304fCF2BEEAF171e6EaA14B493B648;
    address publicSaleAddress = 0x28Ee13B9f4cACACF1354d14e7f238eab013eeC6F;
    address privateSaleAddress = 0x0Cf5AD01B31AA9c19A1feb7e595acB01F65F0aC9;
    address airdropAddress = 0x9A0389Abe390b3d8dF6fcC9723C215Ab8Ef00a4c;

    uint256 rewardPoolAllocation = 65000000 ether;
    uint256 marketingAllocation = 10000000 ether;
    uint256 liquidityAllocation = 8000000 ether;
    uint256 teamAllocation = 6000000 ether;
    uint256 publicSaleAllocation = 5000000 ether;
    uint256 privateSaleAllocation = 5000000 ether;
    uint256 airdropAllocation = 1000000 ether;
    
    constructor() ERC20("Cryptobows", "CBOW") {
        _mint(rewardPoolAddress, rewardPoolAllocation);
        _mint(marketingAddress, marketingAllocation);
        _mint(liquidityAddress, liquidityAllocation);
        _mint(teamAddress, teamAllocation);
        _mint(publicSaleAddress, publicSaleAllocation);
        _mint(privateSaleAddress, privateSaleAllocation);
        _mint(airdropAddress, airdropAllocation);
    }
    
    function burn(address user, uint256 amount) external {
        require(allowedAddresses[msg.sender], "Address not authorized");
        require(msg.sender == user, "You can only burn your own tokens");
        _burn(user, amount);
    }

    function mint(address to, uint256 value) external {
        require(allowedAddresses[msg.sender], "Address not authorized");
        require(value + totalSupply() < maxSupply, "The max supply has been reached");
        _mint(to, value);
    }

    function setAllowedAddresses(address _address, bool _access) public onlyOwner {
        allowedAddresses[_address] = _access;
    }

    
}