// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded;

    // function fund() public payable {
    //     //50$
    //     uint256 minimumUSD = 50 * 10 ** 18;
    //     require(getConversionRate(msg.value) >= minimumUSD, "Error for Balance");
    //     addressToAmountFunded[msg.sender] += msg.value;

    // }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xc751E86208F0F8aF2d5CD0e29716cA7AD98B5eF5);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xc751E86208F0F8aF2d5CD0e29716cA7AD98B5eF5);
        (uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answerInRound)
        = priceFeed.latestRoundData();
        
        // Or we can use this way
        // (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer);
        
    }
}