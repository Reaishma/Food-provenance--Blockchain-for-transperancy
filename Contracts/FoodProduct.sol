// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./FoodOrigin.sol";

/**
 * @title FoodProduct
 * @dev Contract for managing individual food products
 */
contract FoodProduct {
    
    struct Product {
        uint256 productId;
        string name;
        string category;
        uint256 originId;
        uint256 harvestDate;
        uint256 expiryDate;
        uint256 batchNumber;
        address currentOwner;
        ProductStatus status;
        bool isOrganic;
        uint8 qualityRating;
        string ipfsHash;  // For storing additional product data
    }
    
    enum ProductStatus {
        Harvested,
        Processing,
        Packaging,
        Shipping,
        Delivered,
        Sold
    }
    
    struct QualityCheck {
        uint256 timestamp;
        address inspector;
        uint8 rating;
        string notes;
        bool passed;
    }
    
    mapping(uint256 => Product) public products;
    mapping(uint256 => QualityCheck[]) public qualityChecks;
    mapping(address => bool) public authorizedInspectors;
    mapping(uint256 => address[]) public productOwnershipHistory;
    
    uint256 public nextProductId = 1;
    address public owner;
    FoodOrigin public foodOriginContract;
    
    event ProductCreated(uint256 indexed productId, string name, uint256 originId);
    event ProductTransferred(uint256 indexed productId, address from, address to);
    event StatusUpdated(uint256 indexed productId, ProductStatus newStatus);
    event QualityCheckAdded(uint256 indexed productId, address inspector, uint8 rating);
    event InspectorAuthorized(address indexed inspector);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier onlyProductOwner(uint256 _productId) {
        require(products[_productId].currentOwner == msg.sender, "Only product owner can call this");
        _;
    }
    
    modifier onlyAuthorizedInspector() {
        require(authorizedInspectors[msg.sender], "Only authorized inspectors can call this");
        _;
    }
    
    modifier productExists(uint256 _productId) {
        require(_productId < nextProductId, "Product does not exist");
        _;
    }
    
    constructor(address _foodOriginContract) {
        owner = msg.sender;
        foodOriginContract = FoodOrigin(_foodOriginContract);
    }
    
    function createProduct(
        string memory _name,
        string memory _category,
        uint256 _originId,
        uint256 _expiryDate,
        uint256 _batchNumber,
        bool _isOrganic,
        string memory _ipfsHash
    ) public returns (uint256) {
        uint256 productId = nextProductId++;
        
        products[productId] = Product({
            productId: productId,
            name: _name,
            category: _category,
            originId: _originId,
            harvestDate: block.timestamp,
            expiryDate: _expiryDate,
            batchNumber: _batchNumber,
            currentOwner: msg.sender,
            status: ProductStatus.Harvested,
            isOrganic: _isOrganic,
            qualityRating: 0,
            ipfsHash: _ipfsHash
        });
        
        productOwnershipHistory[productId].push(msg.sender);
        
        emit ProductCreated(productId, _name, _originId);
        return productId;
    }
    
    function transferProduct(uint256 _productId, address _newOwner) 
        public 
        productExists(_productId) 
        onlyProductOwner(_productId) 
    {
        address previousOwner = products[_productId].currentOwner;
        products[_productId].currentOwner = _newOwner;
        productOwnershipHistory[_productId].push(_newOwner);
        
        emit ProductTransferred(_productId, previousOwner, _newOwner);
    }
    
    function updateStatus(uint256 _productId, ProductStatus _newStatus) 
        public 
        productExists(_productId) 
        onlyProductOwner(_productId) 
    {
        products[_productId].status = _newStatus;
        emit StatusUpdated(_productId, _newStatus);
    }
    
    function addQualityCheck(
        uint256 _productId,
        uint8 _rating,
        string memory _notes,
        bool _passed
    ) public productExists(_productId) onlyAuthorizedInspector {
        require(_rating <= 10, "Rating must be between 0 and 10");
        
        qualityChecks[_productId].push(QualityCheck({
            timestamp: block.timestamp,
            inspector: msg.sender,
            rating: _rating,
            notes: _notes,
            passed: _passed
        }));
        
        // Update product quality rating to latest check
        products[_productId].qualityRating = _rating;
        
        emit QualityCheckAdded(_productId, msg.sender, _rating);
    }
    
    function authorizeInspector(address _inspector) public onlyOwner {
        authorizedInspectors[_inspector] = true;
        emit InspectorAuthorized(_inspector);
    }
    
    function getProduct(uint256 _productId) public view productExists(_productId) returns (
        string memory name,
        string memory category,
        uint256 originId,
        uint256 harvestDate,
        uint256 expiryDate,
        address currentOwner,
        ProductStatus status,
        bool isOrganic,
        uint8 qualityRating
    ) {
        Product memory product = products[_productId];
        return (
            product.name,
            product.category,
            product.originId,
            product.harvestDate,
            product.expiryDate,
            product.currentOwner,
            product.status,
            product.isOrganic,
            product.qualityRating
        );
    }
    
    function getProductHistory(uint256 _productId) public view productExists(_productId) returns (address[] memory) {
        return productOwnershipHistory[_productId];
    }
    
    function getQualityChecks(uint256 _productId) public view productExists(_productId) returns (uint256) {
        return qualityChecks[_productId].length;
    }
    
    function getQualityCheck(uint256 _productId, uint256 _checkIndex) public view returns (
        uint256 timestamp,
        address inspector,
        uint8 rating,
        string memory notes,
        bool passed
    ) {
        require(_checkIndex < qualityChecks[_productId].length, "Quality check index out of bounds");
        
        QualityCheck memory check = qualityChecks[_productId][_checkIndex];
        return (check.timestamp, check.inspector, check.rating, check.notes, check.passed);
    }
    
    function isProductExpired(uint256 _productId) public view productExists(_productId) returns (bool) {
        return block.timestamp > products[_productId].expiryDate;
    }
}