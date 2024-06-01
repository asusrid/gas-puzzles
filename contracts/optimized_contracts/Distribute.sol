// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address payable public immutable contributor1;
    address payable public immutable contributor2;
    address payable public immutable contributor3;
    address payable public immutable contributor4;
    uint256 public immutable createTime;

    constructor(address[4] memory _contributors) payable {
        contributor1 = payable(_contributors[0]);
        contributor2 = payable(_contributors[1]);
        contributor3 = payable(_contributors[2]);
        contributor4 = payable(_contributors[3]);
        createTime = block.timestamp;
    }

    function distribute() external {
        require(
            block.timestamp > createTime + 1 weeks,
            'cannot distribute yet'
        );

        uint256 amount = address(this).balance >> 2;

        payable(contributor1).transfer(amount);
        payable(contributor2).transfer(amount);
        payable(contributor3).transfer(amount);
        payable(contributor4).transfer(amount);

        // selfdestruct(contributor1);
        // selfdestruct(contributor2);
        // selfdestruct(contributor3);
        // selfdestruct(contributor4);
    }
}
