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
    string nafdacNumber;
    string applicant;
  }
  
  struct CompanyCertificates {
    string tin;
    string rcNumber;
    string incorporation;
    string license;
    uint256 dateCreated;
  }
  
  mapping (address=>CompanyDetails) public companyDetails;
  mapping (address=>CompanyCertificates) public companyCertificates;

  mapping (address=>bool) public registeredCompanies;
  mapping (address=>bool) public verifiedCompanies;

  
  // EVENTS
  event RegisteredCompanyEvent (
    uint256 _id,
    string _name,
    string _nafdacNumber,
    string _applicant
  );
  event CompletedCompanyEvent (
    uint256 _id,
    uint256 _dateCreated
  );
  
  event VerifiedCompanyEvent (
    uint256  _id,
    address _companyAddress,
    uint256 _dateVerified
  );
  

  constructor() public {
    
  }

  function registerCompany (string calldata _name, string calldata _nafdacNumber, string calldata _applicant ) external {

    require(!registeredCompanies[msg.sender], "Company with this ADDRESS already exist");
    companyCount = companyCount.add(1);

    companyDetails[msg.sender] = CompanyDetails(companyCount, _name, _nafdacNumber, _applicant);

    emit RegisteredCompanyEvent(companyCount, _name, _nafdacNumber, _applicant); 

  }

  function uploadCertificates(string calldata _tin, string calldata _rcNumber, string calldata _incorporation, string calldata _license) external {

    CompanyDetails storage company = companyDetails[msg.sender];
    bytes memory name = bytes(company.name); 

    require(name.length != 0, "Company with this ADDRESS does not exist");
    uint256 time = block.timestamp;

    companyCertificates[msg.sender] = CompanyCertificates(_tin, _rcNumber, _incorporation, _license, time);

    registeredCompanies[msg.sender] = true;

    emit CompletedCompanyEvent(company.id, time); 

  }

  function verifyCompany(address  _companyAddress) external onlyOwner {

    require(!registeredCompanies[_companyAddress], "Company with this NAFDAC number does not exist");

    verifiedCompanies[_companyAddress] = true;
    verifiedCompanyCount.add(1);

    emit VerifiedCompanyEvent(verifiedCompanyCount, _companyAddress, block.timestamp);

  }

    
  

 


}