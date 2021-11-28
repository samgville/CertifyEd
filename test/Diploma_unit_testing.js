const { expect } = require("chai");
//const { deployments, getChainId } = require('hardhat');
//const { networkConfig, developmentChains } = require('../../helper-hardhat-config');

describe('Diploma Certificate Unit Tests', function() {
    before(async function () {
      
      Diploma = await ethers.getContractFactory('Diploma');
      diploma = await Diploma.deploy();

    });

    beforeEach(async function () {
    const [owner] = await ethers.getSigners();
    });

    it('Should create a certificate with the set information', async function () {
        createCertificate

          expect(await diploma.connect(owner).createCertificate(PARAMs)).to.be.;
        });

    it('Should return the Certificates from an Address', async function () {
        getCertificatesFromOwner

      expect(await cryptoBabiesGenesis.connect(account1).requestCreation(0)).to.be.reverted;
        });

    it('Should combine two certificates and create a new one', async function () {
        combineCertificates
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should not allow to mint when value is not as high as cost', async function () {
        getScoreFromCertificate
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should not allow to mint when value is not as high as cost', async function () {
        getStudentFromCertificate
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should not allow to mint when value is not as high as cost', async function () {
        getCourseFromCertificate
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should not allow to mint when value is not as high as cost', async function () {
        getTypeFromCertificate
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should not allow to mint when value is not as high as cost', async function () {
        payCourseCreator
        await cryptoBabiesGenesis.setCost(100);
        expect(await cryptoBabiesGenesis.connect(account1).requestCreation(1)).to.be.reverted;

    });
    it('Should change the cost of the tokens', async function () {

        withdrawRoyalties
          await cryptoBabiesGenesis.setCost(1);
          let object = await cryptoBabiesGenesis.getCost();
          console.log(Object.values(object));
          expect(object).to.equal(1);

    });
  });
