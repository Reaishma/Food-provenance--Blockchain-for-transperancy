const FoodTracker = artifacts.require("FoodTracker");

module.exports = function (deployer) {
  deployer.deploy(FoodTracker);
};