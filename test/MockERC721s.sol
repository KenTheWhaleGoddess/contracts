// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// gene parmesan is a radbro - https://twitter.com/dsonoiki  https://etherscan.io/tx/0xf49ea595f7f57441b4be4ef89856b8487e80fa1b79cc0dd126068f40f604e66a

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract MockERC721ZERO is ERC721("HI", "ZERO") {
    function balanceOf(address _user) public pure override returns (uint256) {
        return 0;
    }

}

contract MockERC721ONE is ERC721("HI", "ZERO") {
    function balanceOf(address _user) public pure override returns (uint256) {
        return 1;
    }

}