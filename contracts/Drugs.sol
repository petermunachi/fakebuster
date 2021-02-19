// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import './interfaces/ICompany.sol';



contract Drugs is Ownable {
  ICompany company;


  constructor(address _company) public {
    company = ICompany(_company);
  }

}