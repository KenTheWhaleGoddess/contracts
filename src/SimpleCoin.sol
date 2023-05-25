// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// gene parmesan is a radbro - https://twitter.com/dsonoiki  https://etherscan.io/tx/0xf49ea595f7f57441b4be4ef89856b8487e80fa1b79cc0dd126068f40f604e66a

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract SimpleCoin is Ownable, ERC20 {

    constructor() ERC20("Miya Black Hearted Cyber Baby Angel Token", "MIYA") {
        _mint(0x41538872240Ef02D6eD9aC45cf4Ff864349D51ED, 4444444444 * 10 ** 18);
    }

}