// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    
    using SafeMathChainlink for uint256;

    mapping(address => uint256) public addressToAmountFunded;

    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    function fund() public payable {
        // 50$
        uint256 minimumUSD = 50;
        require(getConversionRate(msg.value) >= minimumUSD, "Error for Balance");
        addressToAmountFunded[msg.sender] += msg.value;

    }

    // input unit is Gwei
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / (10 ** 17);
        return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answerInRound)
        = priceFeed.latestRoundData();
        
        // Or we can use in this way
        // (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    function withdraw() public onlyOwner payable {
        // only want the contract admin/owner
        msg.sender.transfer(address(this).balance);
    }
}