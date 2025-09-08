const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('.'));

// Serve static files
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// API endpoint for blockchain simulation
app.get('/api/track/:productId', (req, res) => {
    const { productId } = req.params;
    
    // Simulate blockchain response
    const trackingData = {
        productId,
        name: 'Organic Apples',
        origin: 'Washington State, USA',
        organic: true,
        qualityScore: 9.2,
        certifications: ['USDA Organic', 'Fair Trade'],
        journey: [
            {
                stage: 'Farm Origin',
                location: 'Green Valley Farm, Washington',
                date: '2025-08-15',
                status: 'completed',
                statusText: 'Harvested',
                hash: '0xa1b2c3d4e5f6g7h8'
            },
            {
                stage: 'Processing',
                location: 'Pacific Processing Center',
                date: '2025-08-17',
                status: 'completed',
                statusText: 'Cleaned & Packed',
                hash: '0xe5f6g7h8i9j0k1l2'
            },
            {
                stage: 'Distribution',
                location: 'Regional Distribution Hub',
                date: '2025-08-20',
                status: 'completed',
                statusText: 'In Transit',
                hash: '0xi9j0k1l2m3n4o5p6'
            },
            {
                stage: 'Retail',
                location: 'FreshMart Store #123',
                date: '2025-08-22',
                status: 'completed',
                statusText: 'Available for Sale',
                hash: '0xm3n4o5p6q7r8s9t0'
            }
        ]
    };
    
    res.json(trackingData);
});

// API endpoint for blockchain status
app.get('/api/status', (req, res) => {
    res.json({
        network: {
            status: 'online',
            message: 'Connected to Ganache'
        },
        contract: {
            status: 'online',
            message: 'Smart Contract Deployed'
        },
        transactions: [
            {
                id: '0xa1b2c3d4',
                type: 'Add Product',
                product: 'Organic Tomatoes',
                time: '2 minutes ago'
            },
            {
                id: '0xe5f6g7h8',
                type: 'Update Location',
                product: 'Fresh Milk',
                time: '5 minutes ago'
            }
        ]
    });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`🌱 FoodTrace Blockchain Server running on port ${PORT}`);
    console.log(`🔗 Access the application at: http://localhost:${PORT}`);
    console.log(`📊 Features: Ethereum blockchain, Solidity smart contracts, Web3.js`);
});