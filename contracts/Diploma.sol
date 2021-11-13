//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721";

contract DiplomaCreator is ERC721 {

  struct Diploma {
    string course_name;
    string student_name;
    uint16 score;

  }

} npm install -g npm@8.1.2
