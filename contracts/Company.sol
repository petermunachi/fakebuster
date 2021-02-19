// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Company is Ownable {

  // Instatiating libraries
  using SafeMath for uint;

  //VARIABLES
  uint256 public companyCount;
  uint256 public verifiedCompanyCount;

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
  mapping (string=>bool) public verifiedCompanies;

  
  // EVENTS
  event CompanyDetailsEvent (
    uint256  _id,
    string  _name,
    string  _tin,
    string  _dateOfIncorporation,
    string _certOfIncorporation,
    string _nafdacNumber,
    string _rcNumber,
    uint256 _dateCreated
    
  );
  
  event VerifiedCompanyEvent (
    uint256  _id,
    string _nafdacNumber,
    uint256 _dateVerified
  );
  

  constructor() public {
    
  }

  function registerCompany (string calldata _name, string calldata _tin, string calldata _dateOfIncorporation, string calldata _certOfIncorporation, string calldata _nafdacNumber, string calldata _rcNumber ) external {

    require(!registeredCompanies[_nafdacNumber], "Company with this NAFDAC number already exist");
    companyCount = companyCount.add(1);

    companyDetails[msg.sender] = CompanyDetails(companyCount, _name, _tin, _dateOfIncorporation, _certOfIncorporation,  _nafdacNumber, _rcNumber, block.timestamp);

    registeredCompanies[_nafdacNumber] = true;    

    emit CompanyDetailsEvent(companyCount, _name, _tin, _dateOfIncorporation, _certOfIncorporation,  _nafdacNumber, _rcNumber, block.timestamp);

  }

  function verifyCompany(string calldata _nafdacNumber) external onlyOwner {

    require(registeredCompanies[_nafdacNumber], "Company with this NAFDAC number does not exist");

    verifiedCompanies[_nafdacNumber] = true;
    verifiedCompanyCount.add(1);

    emit VerifiedCompanyEvent(verifiedCompanyCount, _nafdacNumber, block.timestamp);

  }

    
  

 


}