// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 导入 openzeppelin ，在线IDE中会自动下载，稍等在 .deep 文件夹中就可以看见了
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AOP is ERC20 {

    // 继承ERC20，传入父类的构造函数参数，设置 token 名称 和简称
    constructor(uint initialSupply) ERC20("AOP", "AOP") {
        _mint(msg.sender, initialSupply);
    }

    // 我们这直接就不要小数点了 0位
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}
