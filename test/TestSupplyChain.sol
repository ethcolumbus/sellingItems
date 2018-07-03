pragma solidity ^0.4.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract ThrowProxy {
  address public target;
  bytes data;

  function ThrowProxy(address _target) payable {
    target = _target;
  }

  //prime the data using the fallback function.
  function() {
    data = msg.data;
  }

  function execute() payable returns (bool) {
    return target.call(data);
  }
}

contract TestSupplyChain {

    // Test for failing conditions in this contracts
    // test that every modifier is working

    // buyItem

    // Sad attempt at using ThrowProxy
    /*function testThrow() {
      SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
      supplyChain.addItem("something", 3);
      ThrowProxy throwProxy = new ThrowProxy(address(supplyChain));

      SupplyChain(address(throwProxy)).buyItem(0);
      bool r = throwProxy.execute.gas(200000).value(5)();

      Assert.isFalse(r, "Should be false, as it should throw");
    }*/

    // test for failure if user does not send enough funds
    function testThatUserNeedsEnoughFunds() public {
      SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
      supplyChain.addItem("something", 3);
      //address(supplyChain).buyItem.value(5)(0);
      //supplyChain.buyItem(0);
      supplyChain.buyItem.value(5)(0);
    }

    // test for failure if user does not send enough funds
    /*function testThatUserNeedsEnoughFundsOLD() public {
      SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());
      supplyChain.addItem("something", 3);
      bool result = address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 0)));
      Assert.isFalse(result, "able to buy item with less funds than required");
      //uint expected = 1;
      //supplyChain.buyItem(0);
      //uint actual = supplyChain.fetchItem(0)[3];
      //Assert.isEqual(actual, expected, "able to buy item with less funds than required");
    }*/
    // test for purchasing an item that is not for Sale
    //function testThatYouCantSellItemsThatArentForSale() public {
      //supplyChain.addItem("something else", 3);
      //address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 1)));
      //bool result = address(supplyChain).call.value(5)(bytes4(keccak256("buyItem(uint)", 1)));
      //Assert.isFalse(result, "able to buy item that's not for sale");
    //}


    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

    function() public payable {} 


}
