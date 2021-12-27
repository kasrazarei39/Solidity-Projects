from brownie import accounts, SimpleStorage

# *** Use this commad to test one method: brownie test -k 'method_name' *** #

# *** Use this commad to open python shell after test to check values: brownie test --pdb *** #


def test_deploy():
    # Arrange
    account = accounts[0]
    
    # Act
    simple_storage = SimpleStorage.deploy({"from": account})
    starting_value = simple_storage.retrieve()
    expected_value = 0
    
    # Assert
    assert starting_value == expected_value


def test_updating_storage():
    # Arrange
    account = accounts[0]
    simple_storage = SimpleStorage.deploy({"from": account})
    
    # Act
    expected = 15
    simple_storage.store(expected, {"from": account})
    
    # Assert
    assert expected == simple_storage.retrieve()