// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25; // This allows any version from 0.8.25 to less than 0.9.0

contract SimpleStorage {
    uint256 private favoriteNumber; // Stores the user's favorite number

    uint256[] public favoriteNumbers; // Dynamic array to store multiple favorite numbers

    // Struct to store a person’s name and their favorite number
    struct Person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    Person[] public people; // Array of Person structs to store multiple people's data

    // Enum to manage contract states (Active or Inactive)
    enum ContractState {
        Active, // State representing an active contract
        Inactive // State representing an inactive contract
    }

    ContractState public state; // State variable to store the current contract state

     // Mapping name to user favorite number
    mapping(string => uint256) public nameToFavoriteNumber;

    // Create event called NumberUpdated
    event NumberUpdated(uint256 newNumber);

    function storeNumber(uint256 number) public {
        favoriteNumber = number;

        // Emit NumberUpdated event
        emit NumberUpdated(favoriteNumber);
    } 

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreatherThan(int userInputValue) public view returns (bool) {
        if (int256(favoriteNumber) > userInputValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++ ) {
            sum = sum + i;
        }
        return sum;
    }

    string internal AnInternalVariable = "Holds some string";

    function internalFunction() internal view returns (string memory) {
        return AnInternalVariable;
    }

    function callInternalFunction() internal view returns (string memory) {
        return internalFunction();
    }

    // external function
    function externalFunction() external pure returns (string memory) {
        return "This is an external function";
    }

    // test external function
    function testExternalFunction() public view returns(string memory) {
        return this.externalFunction();
    }

    // addFavoriteNumber function
    function addFavoriteNumber(uint userFavoriteNumber) public {
        favoriteNumbers.push(userFavoriteNumber);
    }
    
    // Add Person function
   function addPerson(string memory _name, uint _favoriteNumber) public {
        // people.push(Person(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
   }

    // Change the contract state to active
   function activateContract() public {
        state = ContractState.Active;
   }

    // Change the contract state to active
   function deactivateContract() public {
        state = ContractState.Inactive;
   }

    // Checks whether the contract state is currently active
    function isActive() public view returns (bool) {
        bool isActiveState = (state == ContractState.Active);
            return isActiveState;
    }

    // This function uses memory variable to make calculations
    function addNunbers(uint256 _num1, uint256 _num2) public pure returns (uint256) {
        uint256 newNumber = _num1 + _num2;
        return newNumber;
    }

    // Function that takes a calldata string parameter and processes it without modifying the input
    function greetings(string calldata _name) public pure returns (string memory) {
        string memory greet = string(abi.encodePacked("Hello", _name));
        return greet;
    }

}
