# FoodTrace - Blockchain Food Origin Tracking System

A comprehensive blockchain-based food origin tracking system built on Ethereum using Solidity smart contracts, Truffle framework, and Web3.js integration.

## 🌟 Features

- **Blockchain Transparency**: Complete supply chain visibility on Ethereum
- **Smart Contracts**: Solidity-based contracts for food origin and product management
- **Real-time Tracking**: Live tracking of food products from farm to consumer
- **Quality Assurance**: Automated quality scoring and certification verification
- **Professional UI**: Modern web interface with responsive design
- **MetaMask Integration**: Browser wallet connectivity for blockchain interactions

## 🔧 Technology Stack

### Blockchain
- **Ethereum**: Primary blockchain platform
- **Solidity 0.8.19**: Smart contract development
- **Truffle Suite**: Development framework
- **Ganache**: Local blockchain for testing
- **Web3.js**: Blockchain interaction library

### Frontend
- **HTML5/CSS3**: Modern responsive design
- **JavaScript ES6+**: Client-side functionality
- **Font Awesome**: Icon library
- **Professional UI**: Orange color scheme with realistic visuals

### Backend
- **Node.js**: Runtime environment
- **Express.js**: Web server framework
- **CORS**: Cross-origin resource sharing

## 📁 Project Structure

```
├── contracts/
│   ├── FoodOrigin.sol          # Origin management contract
│   ├── FoodProduct.sol         # Product lifecycle contract
│   └── FoodTracker.sol         # Main tracking contract
├── migrations/
│   ├── 1_initial_migration.js  # Initial deployment
│   └── 2_deploy_contracts.js   # Contract deployment
├── index.html                  # Single-page application
├── app.js                      # Express server
├── truffle.js                  # Truffle configuration
├── package.json                # Dependencies
└── README.md                   # This file
```

## 🚀 Getting Started

### Prerequisites
- Node.js (v14 or higher)
- Truffle Suite: `npm install -g truffle`
- Ganache: Download from [Truffle website](https://trufflesuite.com/ganache/)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd foodtrace-blockchain
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start Ganache**
   - Launch Ganache application
   - Create a new workspace or quickstart
   - Note the RPC server address (default: http://127.0.0.1:7545)

4. **Compile smart contracts**
   ```bash
   truffle compile
   ```

5. **Deploy contracts to Ganache**
   ```bash
   truffle migrate --network development
   ```

6. **Start the application**
   ```bash
   npm start
   ```

7. **Access the application**
   - Open browser to `http://localhost:3000`
   - Install MetaMask browser extension
   - Connect MetaMask to your local Ganache network

## 🔗 Smart Contracts

### FoodOrigin.sol
Manages farm and origin information:
- Farm registration and verification
- Location and certification tracking
- Farmer authorization system

### FoodProduct.sol  
Handles individual product lifecycle:
- Product creation and ownership
- Status updates through supply chain
- Quality check recording

### FoodTracker.sol
Main contract for supply chain events:
- Immutable event logging
- Product verification
- Supply chain visualization

## 🌐 API Endpoints

- `GET /api/products/:productId` - Get product details
- `GET /api/origins/:originId` - Get origin information  
- `GET /api/blockchain/status` - Get blockchain network status

## 🎨 UI Features

- **Professional Design**: Orange color scheme with realistic imagery
- **Responsive Layout**: Works on desktop, tablet, and mobile
- **Interactive Tracking**: Product ID search with visual timeline
- **Blockchain Status**: Live network and contract status indicators
- **Supply Chain Visualization**: Step-by-step journey display

## 📱 Usage

1. **Track a Product**: Enter product ID (e.g., "FT001234567")
2. **View Supply Chain**: See complete journey from farm to store
3. **Verify Authenticity**: Check blockchain verification status
4. **Quality Information**: Review quality scores and certifications

## 🧪 Testing

```bash
# Run contract tests
truffle test

# Start development server
npm run dev

# Check blockchain connection
truffle console --network development
```

## 🚀 Deployment

### Local Network (Ganache)
1. Configure `truffle.js` for your Ganache settings
2. Run `truffle migrate --network development`

### Testnet (Ropsten/Rinkeby)
1. Add testnet configuration to `truffle.js`
2. Set up Infura project and get API key
3. Add mnemonic for testnet account
4. Run `truffle migrate --network ropsten`

## 📊 Smart Contract Functions

### Key Functions
- `registerProduct()` - Register new food product
- `addSupplyChainEvent()` - Add supply chain stage
- `verifyProduct()` - Verify product authenticity
- `getProduct()` - Retrieve product information
- `trackSupplyChain()` - Get complete tracking history

## 🔐 Security Features

- Role-based access control
- Authorized actor system
- Immutable blockchain records
- Quality verification process
- Farmer verification system

## 📄 License

MIT License - Feel free to use for educational and commercial purposes.

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📞 Contact

For questions about this blockchain food tracking system, please create an issue in the repository.

---

**Note**: This is a demonstration project for showcasing blockchain development skills. The data shown is sample data for educational purposes.