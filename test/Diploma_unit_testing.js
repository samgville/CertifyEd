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
        //TODO: Finish tests implementation
          expect(await diploma.connect(owner).createCertificate());
        });

    it('Should return the list Certificates from an Address', async function () {
       // getCertificatesFromOwner
       //TODO: Finish tests implementation
        });

    it('Should combine two certificates and create a new one', async function () {
        // combineCertificates
        //TODO: Finish tests implementation

    });
    it('Should return the score from a certificate', async function () {
        // getScoreFromCertificate
        //TODO: Finish tests implementation

    });
    it('Should return the student from a certificate', async function () {
        //getStudentFromCertificate
        //TODO: Finish tests implementation

    });
    it('Should return the course from a certificate', async function () {
        // getCourseFromCertificate
        //TODO: Finish tests implementation

    });
    it('Should return the type from a certificate', async function () {
        // getTypeFromCertificate
        //TODO: Finish tests implementation

    });
    it('Should pay the course creator', async function () {
        // payCourseCreator
        //TODO: Finish tests implementation
        

    });
    it('Should withdraw royalties to contract creators', async function () {
        //withdrawRoyalties
        //TODO: Finish tests implementation
        
          await diploma.withdrawRoyalties();
          expect(await diploma.connect(account1).withdrawRoyalties()).to.be.reverted;

    });
  });
