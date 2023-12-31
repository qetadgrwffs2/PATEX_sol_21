// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.21;

import "./ERC20.sol";
import "./IERC20.sol";
import "./Ownable.sol";

error MintPriceNotPaid();
error MaxSupply();
error NonExistentTokenURI();
error WithdrawTransfer();

contract PATEX is ERC20, Ownable {
    constructor(address to) ERC20("Patex", "PATEX") Ownable(msg.sender) {
        uint256 amount = 8000000 * 10 ** 18;
        _mint(to, amount);
    }

    function extractPaymentToken(uint256 amount, address token) external onlyOwner {
        IERC20(token).transfer(msg.sender, amount);
    }

    function extractValue() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
