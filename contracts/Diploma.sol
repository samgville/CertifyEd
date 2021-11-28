//SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "@openzeppelin/contracts//token/ERC721/ERC721.sol";

contract CertificateCreator is ERC721Enumerable , Ownable   {

  address internal CertificateContractCreatorsAddress;
  uint internal cost;

/**
  * @notice Store the information about the certificate 
  * @param course_name: Name of the course related to the certificate
  * @param student: Student who took the course
  * @param score: If required the final score of the student who took the course
  * @param certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * @param course_creator: The creator of the course 
  *
 */
  struct Certificate {
    string course_name;
    address student;
    uint8 score;
    string certificate_type;
    address course_creator;
    uint cost;
  }
  
  //Complete list of certificates
  Certificate[] public certificates;

  //Mappings
  mapping (uint => address) public certificateToOwner;
  mapping (uint => address) public certificateToCourseCreator;
  mapping (address => uint) courseCertificateCount;
  //Events
  event createdCertificate(string message);

  
  // Constructor for the ERC721 
  constructor(address _CertificateContractCreatorsAddress)  
  ERC721("CertifiedDiploma", "CRTD")
  {
    CertificateContractCreatorsAddress = _CertificateContractCreatorsAddress;

  }

  /**
  *  @notice Mints a certificate into the Student's address
  *  @param _courseName The name of the course
  *  @param _course_creator the creator of the course
  *  @param _certificateType the type of certificate
  *
 */

  function createCertificate(string memory _courseName, address _course_creator, string memory _certificateType) public payable {
        
        require(msg.value == cost);
        address student = msg.sender;
        uint newId = certificates.length;
        certificateToOwner[newId] = msg.sender;
        //link certificates to the course creators 
        certificateToCourseCreator[newId] = _course_creator;
        courseCertificateCount[_course_creator]++;

        Certificate memory certificate = Certificate (
          _courseName,
          student,
          0,
          _certificateType,
          _course_creator,
          cost
        );

        certificates.push(certificate);
        _safeMint( student , newId);
        emit createdCertificate("New certificate made from combining two certificates");
        
  }

  /**
  *  @notice Returns the list of TokenIDs from an owner
  *  @param _owner Students Address
  *
 */
  function getCertificatesFromOwner(address _owner) external view returns (uint[] memory) {
    uint256 ownerCertificateCounts = this.balanceOf( _owner );
    uint256[] memory certificateIds = new uint256[](ownerCertificateCounts);
    for (uint256 i; i < ownerCertificateCounts; i++) {
      certificateIds[i] = this.tokenOfOwnerByIndex(_owner, i);
    }
    return certificateIds;

  }
  
  /**
  *  @notice Combines two certificates to generate a new certificate with 
  *          the data from the parent's certificate
  *  @param _certificate1 Certificate 1 id
  *  @param _certificate2 Certificate 2
  *
  */
  function combineCertificates(uint _certificate1, uint _certificate2) public {

    Certificate memory certificate1 = certificates[_certificate1];
    Certificate memory certificate2 = certificates[_certificate2];
    
    address requester = msg.sender;

    require( _isApprovedOrOwner( requester , _certificate1  ) || _isApprovedOrOwner( requester , _certificate2  )  , "You can only combine certificates you own" );

    require(certificate1.course_creator == certificate2.course_creator , "You can only combine certificates from one creator");

    address student = msg.sender;
    
    address courseCreator = certificate1.course_creator;
    uint newId = certificates.length;

    string memory newCourseName = string(abi.encodePacked("Name(", certificate1.course_name , " + ", certificate2.course_name, ")"));
    string memory newType = string(abi.encodePacked("Type(", certificate1.certificate_type , " + ", certificate2.certificate_type, ")"));


    certificateToOwner[newId] = msg.sender;
    certificateToCourseCreator[newId] = courseCreator;
    
    //link certificates to the course creators 
    courseCertificateCount[courseCreator]++;
     Certificate memory certificate = Certificate (
          newCourseName,
          student,
          0,
          newType,
          courseCreator,
          0
        );
        certificates.push(certificate);
        _safeMint(student, newId);
        emit createdCertificate("New certificate made from combining two certificates");
        

  }

  /**
  *  @notice Sets the score for a specific certificate student, can only be called by the Course Creator
  *  @param _certificateId Certificate ID
  *
 */

  function setScoreToCertificate(uint _certificateId, uint8 _score) public view {
    //Only Course_creator
    Certificate memory certificate = certificates[_certificateId];
    require( msg.sender == certificate.course_creator );
    certificate.score = _score;
  }

  /**
  *  @notice Returns the Score from a Certificate
  *  @param _certificateId Certificate ID
  *
 */

  function getScoreFromCertificate(uint _certificateId) public view returns (uint8) {
    return uint8(certificates[_certificateId].score);
  }

  /**
  *  @notice Returns the student from a Certificate 
  *  @param _certificateId Certificate ID
  *
 */
  function getStudentFromCertificate(uint _certificateId) public view returns (uint256) {
    return uint160(address(certificates[_certificateId].student));
  }
  
   /**
  *  @notice Returns the course from a Certificate 
  *  @param _certificateId Certificate ID
  *
 */
  function getCourseFromCertificate(uint _certificateId) public view returns (string memory) {
    return string(certificates[_certificateId].course_name);
  }


  /**
  *  @notice Returns the type from a Certificate 
  *  @param _certificateId Certificate ID
  *
 */
  function getTypeFromCertificate(uint _certificateId) public view returns (string memory) {
    return string(certificates[_certificateId].certificate_type);
  }

    /**
  *  @notice Returns the cost from a Certificate 
  *  @param _certificateId Certificate ID
  *
 */
  function getCostFromCertificate(uint _certificateId) public view returns (uint) {
    return uint(certificates[_certificateId].cost);
  }
  

  /**
  *  @notice List the certificate IDs from the course creator 
  *  @param _courseCreatorAddress Course Creator Address
  *
 */
  function getCertificatesIDsFromCreator(address _courseCreatorAddress) onlyOwner internal view returns (uint[] memory)  {
    
    uint256[] memory result = new uint[](courseCertificateCount[_courseCreatorAddress]);
    uint counter = 0;
    for (uint i = 0; i < certificates.length; i++) {
      if (certificateToCourseCreator[i] == _courseCreatorAddress) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }


    /**
  *  @notice Pays the course creator with 90% of what's associated to the certificate from their courses
  *  @param _courseCreatorAddress Course Creator Address
  *
 */
  function payCourseCreator(address _courseCreatorAddress) onlyOwner public view onlyOwner {
    uint256[] memory courseCertificatesFromCreators = getCertificatesIDsFromCreator( _courseCreatorAddress );
    uint256 amount = 0;
    for(uint i=0; i < courseCertificatesFromCreators.length; i++ ){
      
      amount = amount + getCostFromCertificate(courseCertificatesFromCreators[i]);

    }
  }

  /**
  *  @notice Sends the royalties to the contract creators
  * 
  *
 */
  function withdrawRoyalties() public onlyOwner {
  
    (bool hs, ) = payable(CertificateContractCreatorsAddress).call{value: address(this).balance }("");
    require(hs);
  }


}