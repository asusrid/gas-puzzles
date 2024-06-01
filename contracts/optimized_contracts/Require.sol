// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    // Do not modify these variables
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime = 1;

    // Optimize this function
    function purchaseToken() external payable {
        uint curr = block.timestamp;
        if (msg.value != 0.1 ether) {
            revert();
        }

        require(curr > lastPurchaseTime + COOLDOWN);
        lastPurchaseTime = curr;
        // mint the user a token
    }
}
