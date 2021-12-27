from brownie import accounts
import os


def deploy_simple_storate():
    # account = accounts[0]

    # Create Account in safe mode:
    # commad: brownie accounts new 'name'
    # After that insert your private key and password
    # You can see accounts with this command: brownie accounts list
    # account = accounts.load("kasra-test")

    # Or we can use .env
    account = accounts.add(os.getenv("PRIVATE_KEY"))
    print(account)


def main():
    deploy_simple_storate()
