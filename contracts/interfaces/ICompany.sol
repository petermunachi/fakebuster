// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;


interface ICompany {
  function registerCompany (string calldata _name, string calldata _tin, string calldata _dateOfIncorporation, string calldata _certOfIncorporation, string calldata _nafdacNumber, string calldata _rcNumber ) external;
}