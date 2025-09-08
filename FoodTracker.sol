// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title FoodTracker
 * @dev Smart contract for tracking food origin and supply chain
 */
contract FoodTracker {
    
    // Structure to store food product information
    struct FoodProduct {
        string productId;
        string name;
        string origin;
        address farmer;
        uint256 harvestDate;
        bool isOrganic;
        string[] certifications;
        uint8 qualityScore;
        bool exists;
    }
    
    // Structure to store supply chain events
    struct SupplyChainEvent {
        string productId;
        string stage;      // Farm, Processing, Distribution, Retail
        string location;
        address actor;
        uint256 timestamp;
        string status;
        string description;
    }
    
    // Mappings to store data
    mapping(string => FoodProduct) public products;
    mapping(string => SupplyChainEvent[]) public supplyChain;
    mapping(address => bool) public authorizedActors;
    
    // Contract owner
    address public owner;
    
    // Events
    event ProductRegistered(string indexed productId, string name, address indexed farmer);
    event SupplyChainUpdated(string indexed productId, string stage, address indexed actor);
    event ActorAuthorized(address indexed actor);
    event ActorRevoked(address indexed actor);
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }
    
    modifier onlyAuthorized() {
        require(authorizedActors[msg.sender] || msg.sender == owner, "Not authorized");
        _;
    }
    
    modifier productExists(string memory _productId) {
        require(products[_productId].exists, "Product does not exist");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        authorizedActors[msg.sender] = true;
    }
    
    /**
     * @dev Register a new food product
     */
    function registerProduct(
        string memory _productId,
        string memory _name,
        string memory _origin,
        bool _isOrganic,
        string[] memory _certifications,
        uint8 _qualityScore
    ) public onlyAuthorized {
        require(!products[_productId].exists, "Product already exists");
        require(_qualityScore <= 10, "Quality score must be between 0-10");
        
        products[_productId] = FoodProduct({
            productId: _productId,
            name: _name,
            origin: _origin,
            farmer: msg.sender,
            harvestDate: block.timestamp,
            isOrganic: _isOrganic,
            certifications: _certifications,
            qualityScore: _qualityScore,
            exists: true
        });
        
        // Add initial supply chain event
        supplyChain[_productId].push(SupplyChainEvent({
            productId: _productId,
            stage: "Farm Origin",
            location: _origin,
            actor: msg.sender,
            timestamp: block.timestamp,
            status: "Harvested",
            description: "Product registered and harvested"
        }));
        
        emit ProductRegistered(_productId, _name, msg.sender);
    }
    
    /**
     * @dev Add a supply chain event
     */
    function addSupplyChainEvent(
        string memory _productId,
        string memory _stage,
        string memory _location,
        string memory _status,
        string memory _description
    ) public onlyAuthorized productExists(_productId) {
        
        supplyChain[_productId].push(SupplyChainEvent({
            productId: _productId,
            stage: _stage,
            location: _location,
            actor: msg.sender,
            timestamp: block.timestamp,
            status: _status,
            description: _description
        }));
        
        emit SupplyChainUpdated(_productId, _stage, msg.sender);
    }
    
    /**
     * @dev Get product information
     */
    function getProduct(string memory _productId) public view returns (
        string memory productId,
        string memory name,
        string memory origin,
        address farmer,
        uint256 harvestDate,
        bool isOrganic,
        uint8 qualityScore
    ) {
        require(products[_productId].exists, "Product does not exist");
        
        FoodProduct memory product = products[_productId];
        return (
            product.productId,
            product.name,
            product.origin,
            product.farmer,
            product.harvestDate,
            product.isOrganic,
            product.qualityScore
        );
    }
    
    /**
     * @dev Get product certifications
     */
    function getProductCertifications(string memory _productId) public view returns (string[] memory) {
        require(products[_productId].exists, "Product does not exist");
        return products[_productId].certifications;
    }
    
    /**
     * @dev Get supply chain events count
     */
    function getSupplyChainLength(string memory _productId) public view returns (uint256) {
        return supplyChain[_productId].length;
    }
    
    /**
     * @dev Get specific supply chain event
     */
    function getSupplyChainEvent(string memory _productId, uint256 _index) public view returns (
        string memory stage,
        string memory location,
        address actor,
        uint256 timestamp,
        string memory status,
        string memory description
    ) {
        require(_index < supplyChain[_productId].length, "Event index out of bounds");
        
        SupplyChainEvent memory event = supplyChain[_productId][_index];
        return (
            event.stage,
            event.location,
            event.actor,
            event.timestamp,
            event.status,
            event.description
        );
    }
    
    /**
     * @dev Authorize an actor to interact with the contract
     */
    function authorizeActor(address _actor) public onlyOwner {
        authorizedActors[_actor] = true;
        emit ActorAuthorized(_actor);
    }
    
    /**
     * @dev Revoke authorization from an actor
     */
    function revokeActor(address _actor) public onlyOwner {
        authorizedActors[_actor] = false;
        emit ActorRevoked(_actor);
    }
    
    /**
     * @dev Update product quality score
     */
    function updateQualityScore(string memory _productId, uint8 _newScore) public onlyAuthorized productExists(_productId) {
        require(_newScore <= 10, "Quality score must be between 0-10");
        products[_productId].qualityScore = _newScore;
    }
    
    /**
     * @dev Verify product authenticity
     */
    function verifyProduct(string memory _productId) public view returns (bool authentic, uint256 eventCount) {
        if (!products[_productId].exists) {
            return (false, 0);
        }
        return (true, supplyChain[_productId].length);
    }
    
    /**
     * @dev Get all supply chain events for a product (for web3 integration)
     */
    function getAllSupplyChainEvents(string memory _productId) public view returns (
        string[] memory stages,
        string[] memory locations,
        address[] memory actors,
        uint256[] memory timestamps,
        string[] memory statuses
    ) {
        require(products[_productId].exists, "Product does not exist");
        
        uint256 length = supplyChain[_productId].length;
        stages = new string[](length);
        locations = new string[](length);
        actors = new address[](length);
        timestamps = new uint256[](length);
        statuses = new string[](length);
        
        for (uint256 i = 0; i < length; i++) {
            stages[i] = supplyChain[_productId][i].stage;
            locations[i] = supplyChain[_productId][i].location;
            actors[i] = supplyChain[_productId][i].actor;
            timestamps[i] = supplyChain[_productId][i].timestamp;
            statuses[i] = supplyChain[_productId][i].status;
        }
    }
}