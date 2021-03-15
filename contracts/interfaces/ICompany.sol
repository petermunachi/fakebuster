// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;


interface ICompany {
  function registerCompany (string calldata _name, string calldata _nafdacNumber, string calldata _applicant) external;

  function uploadCertificates(string calldata _tin, string calldata _rcNumber, string calldata _incorporation, string calldata _license) external;

}