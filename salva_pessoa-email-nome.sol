// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Money {
    struct Pessoa {
        uint256 id;
        string email;
        address conta;
    }

    mapping(uint256 => Pessoa) public Pessoas;
    event votedEvent(uint256 indexed _candidateId);
    uint256 public candidateConut;

    constructor() {
        candidateConut = 0;
    }

    function addCandidate(string memory _email) public {
        Pessoas[candidateConut] = Pessoa(candidateConut, _email, msg.sender);
        candidateConut++;
    }

    function getPessoas() public view returns (Pessoa[] memory) {
        Pessoa[] memory id = new Pessoa[](candidateConut);
        for (uint256 i = 0; i < candidateConut; i++) {
            Pessoa storage people = Pessoas[i];
            id[i] = people;
        }
        return id;
    }
}
