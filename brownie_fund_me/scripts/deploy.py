from brownie import FundMe, config, network
from scripts.helpful_scripts import get_account


def deploy_fund_me():
    account = get_account()
    # pass the price feed address to our fundme contract
    # if we are on a persistent network like rinkeby, use the assocated address
    # otherwise, deploy mocks
    if network.show_active() != "development":
        price_feed_address = config["networks"][network.show_active(
        )]["eth_usd_price_feed"]
    else:
        pass
    fund_me = FundMe.deploy({"from": account}, publish_source=True)
    print(f"Contract deployed to {fund_me.address}")


def main():
    deploy_fund_me()
