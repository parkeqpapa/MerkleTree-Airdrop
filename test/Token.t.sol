// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract Ttoken is Test {
    Token public token;
    address public alice = address(0x1111111111111111111111111111111111111111);

    function setUp() public {
        bytes32 merkleroot = 0x51e9f5274659e4acee3d6d6963ac5f861f285fbf6f0e341d970a48b7dafa7234;
        vm.prank(address(0x100000));
        token = new Token(merkleroot);
    }

    function test_airdrop() public {
        bytes32[] memory proof = new bytes32[](3);
        proof[0] = 0x3178e3bf2fb74efa8270da66a06cb7fcde2d880cbdabee14aab385888ad0110c;
        proof[1] = 0x09aabf357e7368a800c0baac224d31dd9f017e857b1365b980c0304994110b82;
        proof[2] = 0x69c21cafbdce71045ae037d1bc6425fee0c583ef3c505587cf15a26572a3510d;

        uint256 index = 0;
        uint256 amount = 5000000000000000000;

        assertEq(token.balanceOf(alice), 0);
        vm.prank(alice);
        token.claimAirDrop(proof, index, amount);
        assertEq(token.balanceOf(alice), amount);
    }
}