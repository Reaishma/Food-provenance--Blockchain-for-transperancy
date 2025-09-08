# FoodTrace - Blockchain Food Origin Tracking System

A comprehensive blockchain-based food origin tracking system built on Ethereum using Solidity smart contracts, Truffle framework, and Web3.js integration.


# 🚀 Live 

**FoodTrace-Blockchain food origin tracking system** - https://reaishma.github.io/Food-provenance--Blockchain-for-transperancy/

## Overview 

FoodTrace is a comprehensive blockchain-based food origin tracking system that provides complete transparency and immutable tracking of food products from farm to table. The application leverages Ethereum blockchain technology to create a secure and verifiable supply chain record, enabling consumers to trace the complete journey of their food products including origin, processing, and distribution stages.

The system successfully combines a modern, responsive web frontend with smart contract integration, offering real-time tracking capabilities, quality scoring, and certification verification. Users can input product IDs to retrieve comprehensive tracking information, view supply chain stages with visual timelines, and verify the authenticity and quality of food products through blockchain-verified data.

## Recent Changes

**September 8, 2025:**
- Successfully implemented complete FoodTrace blockchain application with attractive landing page design
- Created comprehensive Solidity smart contract (FoodTracker.sol) with full supply chain tracking functionality
- Built modern responsive web interface with glassmorphism effects, animated blockchain visualization, and smooth scrolling navigation
- Integrated Web3.js for blockchain connectivity with MetaMask and Ganache support
- Added functional food tracking system with timeline visualization and product details display
- Configured Express.js server with API endpoints and workflow for port 5000
- Set up complete Truffle development environment with migration scripts


## Project Architecture

### Frontend Architecture
The frontend features a modern single-page application built with vanilla JavaScript using a class-based architecture (`FoodTrace` class). The design incorporates:
- Responsive glassmorphism UI with gradient backgrounds
- Animated blockchain visualization showing farm-to-table journey
- Smooth scrolling navigation between sections
- Interactive food tracking with visual timeline results
- Real-time blockchain status indicators
- Sample transaction display with periodic updates

### Blockchain Integration

Complete Ethereum blockchain integration through:
- **Web3.js**: Direct blockchain communication and smart contract interaction
- **MetaMask Support**: Browser wallet connectivity for real users
- **Ganache Fallback**: Local development blockchain on port 7545
- **Automatic Network Detection**: Seamless switching between live and development networks
- **Transaction Monitoring**: Real-time status updates and transaction history

### Smart Contract System
The FoodTracker.sol smart contract provides:
- **Product Registration**: Secure on-chain food product registration with metadata
- **Supply Chain Events**: Immutable tracking of each stage (farm, processing, distribution, retail)
- **Authorization System**: Role-based access control for supply chain actors
- **Quality Scoring**: On-chain quality assessment and certification tracking
- **Verification Methods**: Product authenticity verification with event count validation

### Backend Services
Lightweight Express.js server architecture:
- **Static File Serving**: Serves the web application and assets
- **API Simulation**: Mock blockchain responses for development testing (`/api/track/:productId`)
- **CORS Support**: Enables cross-origin requests for Web3 integration
- **Status Endpoints**: Real-time blockchain and contract status reporting

##  Features 

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
- **Font Awesome 6.0.0**: Icon library
- **Professional UI**: Orange color scheme with realistic visuals

### Backend
- **Express.js 5.1.0**: Web server framework
- **CORS 2.8.5**: Cross-origin resource sharing middleware
- **Node.js 20**: Runtime environment

### Development Tools
- **NPM**: Package management and scripts
- **Replit Workflow**: Automated server deployment on port 5000
- **Git**: Version control (automatic commits)


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
- **About Section**: Technology stack display with statistics and certifications
- **Responsive Design**: Mobile-first approach with adaptive layouts
- **Supply Chain Visualization**: Step-by-step journey display

### Development Environment
Complete blockchain development setup:
- **Truffle Configuration**: Smart contract compilation and deployment
- **Migration Scripts**: Automated contract deployment processes
- **Ganache Integration**: Local blockchain for development and testing
- **NPM Workflow**: Automated server startup and dependency management

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
