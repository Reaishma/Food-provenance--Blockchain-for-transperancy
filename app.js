const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(__dirname));

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// API Routes for blockchain interaction
app.get('/api/products/:productId', (req, res) => {
    const { productId } = req.params;
    
    // Mock blockchain data
    const productData = {
        productId: productId,
        name: "Organic Tomatoes",
        category: "Vegetables", 
        origin: {
            farmName: "Green Valley Farms",
            location: "California, USA",
            farmer: "0x742d35Cc6634C0532925a3b8D5432",
            verified: true
        },
        status: "Delivered",
        qualityScore: 9.2,
        isOrganic: true,
        harvestDate: "2025-08-15",
        expiryDate: "2025-09-15",
        supplyChain: [
            {
                stage: "Farm",
                location: "Green Valley Farms, CA",
                timestamp: "2025-08-15T08:00:00Z",
                txHash: "0xa1b2c3d4e5f6789..."
            },
            {
                stage: "Processing",
                location: "Fresh Pack Facility, CA", 
                timestamp: "2025-08-16T14:30:00Z",
                txHash: "0xb2c3d4e5f6789a1..."
            },
            {
                stage: "Distribution",
                location: "Regional Hub, CA",
                timestamp: "2025-08-18T09:15:00Z", 
                txHash: "0xc3d4e5f6789a1b2..."
            },
            {
                stage: "Retail",
                location: "SuperMart Store #123",
                timestamp: "2025-08-20T11:45:00Z",
                txHash: "0xd4e5f6789a1b2c3..."
            }
        ]
    };
    
    res.json(productData);
});

app.get('/api/origins/:originId', (req, res) => {
    const { originId } = req.params;
    
    const originData = {
        originId: originId,
        farmName: "Green Valley Farms",
        location: "Fresno County, California",
        country: "United States",
        coordinates: "36.7378°N 119.7871°W",
        farmer: "0x742d35Cc6634C0532925a3b8D5432",
        isVerified: true,
        certifications: ["USDA Organic", "Fair Trade", "Non-GMO"],
        registrationDate: "2025-01-15"
    };
    
    res.json(originData);
});

app.get('/api/blockchain/status', (req, res) => {
    res.json({
        network: {
            name: "Ethereum Testnet",
            chainId: 3,
            status: "connected",
            blockNumber: 12845672
        },
        contracts: {
            foodOrigin: "0x1234567890abcdef...",
            foodProduct: "0xabcdef1234567890...", 
            foodTracker: "0x567890abcdef1234..."
        },
        gasPrice: "20 gwei"
    });
});

app.listen(PORT, () => {
    console.log(`🍎 Food Origin Tracking API running on port ${PORT}`);
    console.log(`📊 Blockchain endpoints available at /api/*`);
});