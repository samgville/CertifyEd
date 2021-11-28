//SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.2/contracts/access/Ownable.sol";



contract CertificateCreator is ERC721 {
/**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */
  struct Certificate {
    string course_name;
    address student;
    uint8 score;
    string certificate_type;
    address course_creator;
  }
  
  /**
   *
   *
   *
   */
  Certificate[] public certificates;

   //Mappings
    mapping(bytes32 => string) public requestToCharacterName;
    mapping(bytes32 => address) requestToSender;
    mapping(bytes32 => uint256) requestToTokenId;


  //Events
  

  /**
  * Store the information about the certificate
  * @param  : 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */
 
  constructor() public 
  ERC721("CertifiedDiploma", "CRTD")
  {

  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function createCertificate(string _courseName, address _course_creator, string _certificateType ) public payable {
        
        address student = msg.sender;
        uint newId = certificates.length++;

        Certificate memory certificate = Certificate (
          _courseName,
          student,
          _certificateType,
          _course_creator
        );
        certificates.push(certificate);
       if (_safeMint(requestToSender[requestId], newId)){
        emit requestedCharacter(requestId);
        }
  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */
  function getCertificatesFromOwner(address _owner) public {

  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function combineCertificates(uint _certificate1, uint _certificate2) public {
    

    Certificate memory certificate1 = certificates[_certificate1];
    Certificate memory certificate2 = certificates[_certificate2];
    
    require( _isApprovedOrOwner( msg.sender , tokenId ) , 'You can only combine certificates you own' );

    require(certificate1.course_creator == certificate2.course_creator , "You can only combine certificates from one creator");

    address student = msg.sender;
    
    address courseCreator = certificate1.course_creator;
    uint newId = certificates.length++;


   
    string  newCourseName = "(" + certificate1.course_name + " + " + certificate2.course_name + ")" ;
    string  newType = "Type: " + certificate1.certificate_type + " + " + certificate2.certificate_type ;

     Certificate memory certificate = Certificate (
          newCourseName,
          student,
          newType,
          courseCreator
        );
        certificates.push(certificate);
       if (_safeMint(student, newId)){
      //  emit requestedCharacter(requestId);
        }

  }
    /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function setScoreToCertificate(uint _certificateId) public {
    //Only Course_creator
    Certificate certificate = certificates[_certificateId];
    require(msg.sender = Certificate( _certificate ).course_creator);
    
  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function getScoreFromCertificate(address _certificate) public returns (uint8) {
    
  }

/**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function getStudentFromCertificate(address _certificate) public {

  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function getCourseFromCertificate(address _certificate) public {

  }

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function getTypeFromCertificate(address _certificate) public {

  }

  

  /**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function payCourseCreator() public onlyOwner {

  }

/**
  * Store the information about the certificate
  * @attributes: 
  * -course_name: Name of the course related to the certificate
  * -student: Student who took the course
  * -score: If required the final score of the student who took the course
  * -certificate_type: Different types of Certifications for Combining, Pricing, etc.
  * -course_creator: The creator of the course 
  *  
  *
 */

  function withdrawRoyalties() private onlyOwner {

  }



} 
