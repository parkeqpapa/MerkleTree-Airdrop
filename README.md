# Merkle Tree Solidity Project

This project implements a Merkle Tree data structure in Solidity, a contract-oriented programming language for writing smart contracts on the Ethereum blockchain. It also includes an ERC20 token contract and functionality to perform an airdrop of tokens to selected addresses using a Merkle Tree.

## What is a Merkle Tree?

A Merkle Tree is a hash-based data structure that is used to efficiently verify the integrity and membership of large datasets. It is constructed by recursively hashing pairs of nodes until there is a single hash, called the root hash or Merkle root. This root hash can be used to verify the presence of any leaf node in the tree by rehashing the leaf's path from the bottom up and comparing the calculated root hash with the known root hash.

Merkle Trees are widely used in blockchain and cryptocurrency applications to provide efficient and secure verification of transactions and data.

## Features

- Construction of Merkle Trees from leaf nodes
- Calculation of Merkle root hash
- Verification of leaf node membership in the tree
- Support for customizable hash functions (default: Keccak-256)
- ERC20 token contract
- Airdrop of tokens to selected addresses using a Merkle Tree
# Merkle Tree Solidity Project

This project implements a Merkle Tree data structure in Solidity, a contract-oriented programming language for writing smart contracts on the Ethereum blockchain. It also includes an ERC20 token contract and functionality to perform an airdrop of tokens to selected addresses using a Merkle Tree.

## What is a Merkle Tree?

A Merkle Tree is a hash-based data structure that is used to efficiently verify the integrity and membership of large datasets. It is constructed by recursively hashing pairs of nodes until there is a single hash, called the root hash or Merkle root. This root hash can be used to verify the presence of any leaf node in the tree by rehashing the leaf's path from the bottom up and comparing the calculated root hash with the known root hash.

Merkle Trees are widely used in blockchain and cryptocurrency applications to provide efficient and secure verification of transactions and data.

## Features

- Construction of Merkle Trees from leaf nodes
- Calculation of Merkle root hash
- Verification of leaf node membership in the tree
- Support for customizable hash functions (default: Keccak-256)
- ERC20 token contract
- Airdrop of tokens to selected addresses using a Merkle Tree
