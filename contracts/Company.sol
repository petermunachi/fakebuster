// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;
import "@openzeppelin/contracts/math/SafeMath.sol";


contract Company {

  // Instatiating libraries
  using SafeMath for uint;

  //VARIABLES
  uint256 public companyCount;

  struct CompanyDetails {
    uint256 id;
    string name;
    string tin;
    string dateOfIncorporation;
    string certOfIncorporation;
    string nafdacNumber;
    string rcNumber;
    uint256 dateCreated;
  }
  
  mapping (address=>CompanyDetails) public companyDetails;
  mapping (string=>bool) public registeredCompanies;
  
  //EVENTS
  event CompanyDetailsEvent (
    uint256  _id,
    string  _name,
    string  _tin,
    string  _dateOfIncorporation,
    string _certOfIncorporation,
    string _nafdacNumber,
    string _rcNumber,
    uint _dateCreated
  );
  

  constructor() public {
    
  }

  function registerCompany( string memory _name, string memory _tin, string memory _dateOfIncorporation, string memory _certOfIncorporation, string memory _nafdacNumber, string memory _rcNumber ) public {

    require(!registeredCompanies[_nafdacNumber], "Company with this NAFDAC number already exist");
    companyCount = companyCount.add(1);

    companyDetails[msg.sender] = CompanyDetails(companyCount, _name, _tin, _dateOfIncorporation, _certOfIncorporation,  _nafdacNumber, _rcNumber, block.timestamp);

    registeredCompanies[_nafdacNumber] = true;    

    emit CompanyDetailsEvent(companyCount, _name, _tin, _dateOfIncorporation, _certOfIncorporation,  _nafdacNumber, _rcNumber, block.timestamp);

  }

    
  

 


}