// SPDX-License-Identifier: GPL-3.0
// Template from https://docs.soliditylang.org/en/latest/introduction-to-smart-contracts.html
pragma solidity ^0.8.0;

contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping (address => uint) public coinBalances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        coinBalances[receiver] += amount;
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > coinBalances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: coinBalances[msg.sender]
            });

        coinBalances[msg.sender] -= amount;
        coinBalances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
