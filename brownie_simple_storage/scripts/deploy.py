from brownie import accounts


def deploy_simple_storate():
    # account = accounts[0]

    # Create Account in safe mode:
    # brownie accounts new 'name'
    # After that insert your private key and password
    # You can see accounts with this command: brownie accounts list
    account = accounts.load("kasra-test")
    print(account)


def main():
    deploy_simple_storate()
