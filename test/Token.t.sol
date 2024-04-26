// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract Ttoken is Test {
    Token public token;
    address public alice = address(0x1111111111111111111111111111111111111111);
    address public bob = address(0x1111111111111111111111111111111111111114);
    address public notAlice = address(0x001848);

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

        uint256 aliceIndex = 0;
        uint256 aliceAmount = 5000000000000000000;

        assertEq(token.balanceOf(alice), 0);
        vm.prank(alice);
        token.claimAirDrop(proof, aliceIndex, aliceAmount);
        assertEq(token.balanceOf(alice), aliceAmount);
    }

    function test_MultipleAddressCanMint() public {
        bytes32[] memory proof = new bytes32[](3);
        proof[0] = 0x3178e3bf2fb74efa8270da66a06cb7fcde2d880cbdabee14aab385888ad0110c;
        proof[1] = 0x09aabf357e7368a800c0baac224d31dd9f017e857b1365b980c0304994110b82;
        proof[2] = 0x69c21cafbdce71045ae037d1bc6425fee0c583ef3c505587cf15a26572a3510d;

        uint256 aliceIndex = 0;
        uint256 aliceAmount = 5000000000000000000;

        assertEq(token.balanceOf(alice), 0);
        vm.prank(alice);
        token.claimAirDrop(proof, aliceIndex, aliceAmount);
        assertEq(token.balanceOf(alice), aliceAmount);
        
        bytes32[] memory bobProof = new bytes32[](3);
        bobProof[0] = 0x587ebc40ea41f173881cdc9b19300373b6c99a1ef32a2905b449d8087cf21233;
        bobProof[1] = 0x46b26d38b0f19565be44015ed98b4e5de6ed3be865ecb78246a42b54051146ea;
        bobProof[2] = 0x69c21cafbdce71045ae037d1bc6425fee0c583ef3c505587cf15a26572a3510d;

        uint256 bobIndex = 1;
        uint256 bobAmount = 5000000;

        assertEq(token.balanceOf(bob), 0);
        vm.prank(bob);
        token.claimAirDrop(bobProof, bobIndex, bobAmount);
        assertEq(token.balanceOf(bob), bobAmount);

    }

    function test_ShouldNotBeAbleToMint() public {
        bytes32[] memory proof = new bytes32[](3);
        proof[0] = 0x3178e3bf2fb74efa8270da66a06cb7fcde2d880cbdabee14aab385888ad0110c;
        proof[1] = 0x09aabf357e7368a800c0baac224d31dd9f017e857b1365b980c0304994110b82;
        proof[2] = 0x69c21cafbdce71045ae037d1bc6425fee0c583ef3c505587cf15a26572a3510d;

        uint256 index = 0;
        uint256 amount = 5000000000000000000;
        vm.expectRevert();
        vm.prank(notAlice);
        token.claimAirDrop(proof, index, amount);
    }

        function test_CanNotClaimTwice() public {
        bytes32[] memory proof = new bytes32[](3);
        proof[0] = 0x3178e3bf2fb74efa8270da66a06cb7fcde2d880cbdabee14aab385888ad0110c;
        proof[1] = 0x09aabf357e7368a800c0baac224d31dd9f017e857b1365b980c0304994110b82;
        proof[2] = 0x69c21cafbdce71045ae037d1bc6425fee0c583ef3c505587cf15a26572a3510d;

        uint256 aliceIndex = 0;
        uint256 aliceAmount = 5000000000000000000;

        assertEq(token.balanceOf(alice), 0);
        vm.prank(alice);
        token.claimAirDrop(proof, aliceIndex, aliceAmount);
        assertEq(token.balanceOf(alice), aliceAmount);

        vm.expectRevert();
        vm.prank(alice);
        token.claimAirDrop(proof, aliceIndex, aliceAmount);
    }


}