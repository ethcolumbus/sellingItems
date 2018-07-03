pragma solidity ^0.4.21;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {
    uint public initialBalance = 1 ether;
    SupplyChain public cut;

    function beforeEach() public
    {
        cut = new SupplyChain();
    }

    // Test for failing conditions in this contracts
    // test that every modifier is working

    // buyItem

    function testUserPaysTheRightPrice() public payable {
        string memory itemName = "Gem";
        uint   itemPrice = 3;
        cut.addItem(itemName, itemPrice);

        uint sku = 0;
        uint offer = itemPrice + 1; // low ball price
        bool result = address(cut).call.value(offer)(abi.encodeWithSignature("buyItem(uint256)", sku));
        Assert.isTrue(result, "Paid the correct price...");
    }

    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

    function() public payable {} 

}
