// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MiyaCoin.sol";
import "../src/SimpleCoin.sol";
import "./MockERC721s.sol";
import { Hevm } from "hevm/Hevm.sol";

contract CoinTest is Test, Hevm {
    SimpleCoin simple;
    MiyaCoin miya;

    bytes ONE = address(new MockERC721ONE()).code;
    bytes ZERO = address(new MockERC721ZERO()).code;

    address constant dev = address(0x41538872240Ef02D6eD9aC45cf4Ff864349D51ED);
    address constant testReceiver = address(1337);
    uint256 constant testAmount = 100 ether;

    function setUp() public {
        vm.prank(dev);
        simple = new SimpleCoin();
        miya = new MiyaCoin();
        vm.etch(0x5Af0D9827E0c53E4799BB226655A1de152A425a5, ZERO);
        vm.etch(0xD3D9ddd0CF0A5F0BFB8f7fcEAe075DF687eAEBaB, ZERO);
        vm.etch(0xABCDB5710B88f456fED1e99025379e2969F29610, ZERO);
        vm.etch(0x8Fc0D90f2C45a5e7f94904075c952e0943CFCCfd, ZERO);
        vm.etch(0xBfE47D6D4090940D1c7a0066B63d23875E3e2Ac5, ZERO);
        vm.etch(0x441121dF09c8C7F545A9444aB554Ce640B566C4D, ZERO);
        vm.etch(0xE5879aD3A66dd0a654DFd3A78FC6F720B05745F6, ZERO);
        vm.etch(0x1352149Cd78D686043B504e7e7D96C5946b0C39c, ZERO);
        vm.etch(0x7BCF14419DEeF9eb466BeEFA75cF294BcA65D985, ZERO);
        vm.etch(0xFed18c828277E3bD8610F9BAE432e65A651706F7, ZERO);
        vm.etch(0xED37c99f3000D751c460c5e386F02a6dE7581407, ZERO);
        vm.etch(0x2D471c659682E92c79261124B5357Ae90Ff68dEa, ZERO);
        vm.etch(0x0D8A3359182DCa59CCAF36F5c6C6008b83ceB4A6, ZERO);
        vm.etch(0x94Fe1D5DE3A4208C7411AE21968e044AbC17be48, ZERO);
        vm.etch(0x8f7a232aF2347CC5C9C3A245C2f163D248178eaa, ZERO);
        vm.etch(0x186E74aD45bF81fb3712e9657560f8f6361cbBef, ZERO);
        vm.etch(0xF421391011Dc77c0C2489d384C26e915Efd9e2C5, ZERO);
        vm.etch(0x8A45Fb65311aC8434AaD5b8a93D1EbA6Ac4e813b, ZERO);
        vm.etch(0x3a007aFA2dFF13C9DC5020acAE1bCb502d4312e2, ZERO);
        vm.etch(0x499De9CF6465c050aE116Afcbf9105e1d7259cb7, ZERO);
        vm.etch(0x2fC722C1c77170A61F17962CC4D039692f033b43, ZERO);
        vm.etch(0xc62E3fd5B02618f90dD07d1E478963038fA9089c, ZERO);
        vm.etch(0x06078f22055CfB23193882879FD478471C8B4a03, ZERO);
        vm.etch(0xb2619D1aEd8390aF6d7056B0D312557d3D4D419a, ZERO);
        vm.etch(0x4D40C64A8E41aC96b85eE557A434410672221750, ZERO);
        vm.etch(0xcDDe7902fD9D8b2F142F39b11A6F30e213D00964, ZERO);
        vm.etch(0xe03480E9196003D9b4106C56595A1429F7D00f87, ZERO);
        vm.etch(0x67B5eE6e29a4230177Dda07AD7848e42d89cF9a0, ZERO);
        vm.etch(0x71481a928c24c32E4D9a4394FAb3168A3A1Cfd11, ZERO);
        vm.etch(0xEEd41d06AE195CA8f5CaCACE4cd691EE75F0683f, ZERO);
        vm.etch(0x55241fF1f5877CFCA6b3E6CE2fcE30183eA2436A, ZERO);
        vm.etch(0x880a965fAe95f72fe3a3C8e87ED2c9478C8e0a29, ZERO);
        vm.etch(0x4246200d62072Cf8836F1062A115927555B9C497, ZERO);
        vm.etch(0xc284B5407f2409bc43F202F29adA9E41566aF748, ZERO);
        vm.etch(0xd5e0b0F0Ac7c014A1bE55dE2D9De90cD2483d465, ZERO);
        vm.etch(0x392C4a12044c7990f9FE66Ca9F119b1DF83f24AD, ZERO);
        vm.etch(0xB40e89D0A90d6A51E0Bd27040144cfcE51C9bC2d, ZERO);
        vm.etch(0xEB3B0Ac9E4829a92E964e723EfDa9104ce0dE5Ec, ZERO);
        vm.etch(0x285EA754D9418073cC87994F1De143f918551390, ZERO);
        vm.etch(0xdc71c729e6aDf29FD1dbfd1D79e3e7558271a177, ZERO);
        vm.etch(0xC8FFC4E673fE7aa80E46c5d1Bde0fBe746B71341, ZERO);
        vm.etch(0x9a051C1794C2f0ED9518Fcb68973DA84f756e29E, ZERO);
        vm.etch(0x9a051C1794C2f0ED9518Fcb68973DA84f756e29E, ZERO);
        vm.etch(0x07e8D4A25D36D7259879337A923170453944614F, ZERO);
    }

    function testMiyaTransfer() public {
        uint256 initialDevBal = miya.balanceOf(msg.sender);
        console.log(initialDevBal);
        miya.transfer(testReceiver, testAmount);
        assertEq(testAmount, miya.balanceOf(testReceiver));
        assertEq(initialDevBal - testAmount, miya.balanceOf(msg.sender));
    }

    function testSimpleTransfer() public {
        uint256 initialDevBal = simple.balanceOf(msg.sender);

        simple.transfer(testReceiver, testAmount);
        assertEq(testAmount, simple.balanceOf(testReceiver));
        assertEq(initialDevBal - testAmount, simple.balanceOf(msg.sender));
    }
}
