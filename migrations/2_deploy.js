const Coin = artifacts.require("Coin");
const dBank = artifacts.require("dBank");

module.exports = async function(deployer) {
	//deploy Token
	deployer.deploy(Coin);
	deployer.deploy(dBank);

	//assign token into variable to get it's address
	
	//pass token address for dBank contract(for future minting)

	//assign dBank contract into variable to get it's address

	//change token's owner/minter from deployer to dBank
};