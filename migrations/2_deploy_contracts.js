const FoodOrigin = artifacts.require("FoodOrigin");
const FoodProduct = artifacts.require("FoodProduct");
const FoodTracker = artifacts.require("FoodTracker");

module.exports = async function (deployer) {
  // Deploy FoodOrigin first
  await deployer.deploy(FoodOrigin);
  const foodOriginInstance = await FoodOrigin.deployed();
  
  // Deploy FoodProduct with FoodOrigin address
  await deployer.deploy(FoodProduct, foodOriginInstance.address);
  const foodProductInstance = await FoodProduct.deployed();
  
  // Deploy main FoodTracker contract
  await deployer.deploy(FoodTracker);
  const foodTrackerInstance = await FoodTracker.deployed();
  
  console.log("FoodOrigin deployed at:", foodOriginInstance.address);
  console.log("FoodProduct deployed at:", foodProductInstance.address);  
  console.log("FoodTracker deployed at:", foodTrackerInstance.address);
};