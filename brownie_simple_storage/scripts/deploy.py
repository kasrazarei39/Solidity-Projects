from brownie import accounts, config, SimpleStorage
import os


def deploy_simple_storate():
    # Create Account in safe mode:
    # commad: brownie accounts new 'name'
    # After that insert your private key and password
    # You can see accounts with this command: brownie accounts list
    # account = accounts.load("kasra-test")

    # Or we can use .env
    # account = accounts.add(os.getenv("PRIVATE_KEY"))

    # Or we can define wallet in config file
    # account = accounts.add(config["wallets"]["from_key"])

    account = accounts[0]
    simple_storage = SimpleStorage.deploy({"from": account})
    stored_value = simple_storage.retrieve()
    print(stored_value)
    transaction = simple_storage.store(9, {"from": account})
    transaction.wait(1)  # How many block wait
    updated_stored_value = simple_storage.retrieve()
    print(updated_stored_value)


def main():
    deploy_simple_storate()
