require('dotenv').config();

async function main() {
    // Hardhat always runs the compile task when running scripts with its command
    // line interface.
    //
    // If this script is run directly using `node` you may want to call compile
    // manually to make sure everything is compiled
    // await hre.run('compile');
  
    // We get the contract to deploy
    const contractCreatorAddress = process.env.CONTRACT_CREATOR_ADDRESS;

    const CertificateCreator = await hre.ethers.getContractFactory("CertificateCreator");
    const certificateCreator = await CertificateCreator.deploy(contractCreatorAddress);
  
    await certificateCreator.deployed();
  
    console.log("CertificateCreator deployed to:", certificateCreator.address);
  }

  // We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});