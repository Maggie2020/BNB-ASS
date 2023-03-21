pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LiquidityMining {
    address public tokenAddress;
    IERC20 public token;
    mapping(address => uint) public balances;
    uint public totalBalance;

    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
        token = IERC20(tokenAddress);
    }

    function deposit(uint amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[msg.sender] += amount;
        totalBalance += amount;
    }

    function withdraw(uint amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(token.transfer(msg.sender, amount), "Transfer failed");
        balances[msg.sender] -= amount;
        totalBalance -= amount;
    }
}
