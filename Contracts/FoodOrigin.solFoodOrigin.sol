// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title FoodOrigin
 * @dev Contract for managing food origin information
 */
contract FoodOrigin {
    
    struct Origin {
        string farmName;
        string location;
        string country;
        string coordinates;
        address farmer;
        bool isVerified;
        uint256 registrationDate;
        string[] certifications;
    }
    
    mapping(uint256 => Origin) public origins;
    mapping(address => bool) public verifiedFarmers;
    mapping(string => uint256) public locationToOriginId;
    
    uint256 public nextOriginId = 1;
    address public owner;
    
    event OriginRegistered(uint256 indexed originId, string farmName, address indexed farmer);
    event FarmerVerified(address indexed farmer);
    event CertificationAdded(uint256 indexed originId, string certification);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier onlyVerifiedFarmer() {
        require(verifiedFarmers[msg.sender], "Only verified farmers can call this");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function registerOrigin(
        string memory _farmName,
        string memory _location,
        string memory _country,
        string memory _coordinates,
        string[] memory _certifications
    ) public returns (uint256) {
        uint256 originId = nextOriginId++;
        
        origins[originId] = Origin({
            farmName: _farmName,
            location: _location,
            country: _country,
            coordinates: _coordinates,
            farmer: msg.sender,
            isVerified: false,
            registrationDate: block.timestamp,
            certifications: _certifications
        });
        
        locationToOriginId[_location] = originId;
        
        emit OriginRegistered(originId, _farmName, msg.sender);
        return originId;
    }
    
    function verifyFarmer(address _farmer) public onlyOwner {
        verifiedFarmers[_farmer] = true;
        emit FarmerVerified(_farmer);
    }
    
    function verifyOrigin(uint256 _originId) public onlyOwner {
        require(_originId < nextOriginId, "Origin does not exist");
        origins[_originId].isVerified = true;
    }
    
    function addCertification(uint256 _originId, string memory _certification) public onlyVerifiedFarmer {
        require(_originId < nextOriginId, "Origin does not exist");
        require(origins[_originId].farmer == msg.sender, "Only origin farmer can add certifications");
        
        origins[_originId].certifications.push(_certification);
        emit CertificationAdded(_originId, _certification);
    }
    
    function getOrigin(uint256 _originId) public view returns (
        string memory farmName,
        string memory location,
        string memory country,
        string memory coordinates,
        address farmer,
        bool isVerified,
        uint256 registrationDate
    ) {
        require(_originId < nextOriginId, "Origin does not exist");
        Origin memory origin = origins[_originId];
        
        return (
            origin.farmName,
            origin.location,
            origin.country,
            origin.coordinates,
            origin.farmer,
            origin.isVerified,
            origin.registrationDate
        );
    }
    
    function getOriginCertifications(uint256 _originId) public view returns (string[] memory) {
        require(_originId < nextOriginId, "Origin does not exist");
        return origins[_originId].certifications;
    }
}
