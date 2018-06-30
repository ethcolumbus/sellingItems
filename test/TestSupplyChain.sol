pragma solidity ^0.4.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    // Test for failing conditions in this contracts
    // test that every modifier is working

    // buyItem

    // test for failure if user does not send enough funds
    function testThatUserNeedsEnoughFunds() public {
      SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
      supplyChain.addItem("something", 3);
      bool result = address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 0)));
      Assert.isFalse(result, "able to buy item with less funds than required");
      //uint expected = 1;
      //supplyChain.buyItem(0);
      //uint actual = supplyChain.fetchItem(0)[3];
      //Assert.isEqual(actual, expected, "able to buy item with less funds than required");
    }
    // test for purchasing an item that is not for Sale
    function testThatYouCantSellItemsThatArentForSale() public {
      //supplyChain.addItem("something else", 3);
      //address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 1)));
      //bool result = address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 1)));
      //Assert.isFalse(result, "able to buy item that's not for sale");
    }


    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

     


}
