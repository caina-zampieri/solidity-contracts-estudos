// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ParicipantesCadastro {
    struct Pessoa {
        uint256 id;
        string email;
        address conta;
    }

    mapping(uint256 => Pessoa) public Pessoas;

    event votedEvent(uint256 indexed _participanteId);
    uint256 public participanteCount;

    constructor() {
        participanteCount = 0;
    }

    function addParticipante(string memory _email) public {
        Pessoas[participanteCount] = Pessoa(
            participanteCount,
            _email,
            msg.sender
        );
        participanteCount++;
    }

    function getPessoas() public view returns (Pessoa[] memory) {
        Pessoa[] memory id = new Pessoa[](participanteCount);
        for (uint256 i = 0; i < participanteCount; i++) {
            Pessoa storage people = Pessoas[i];
            id[i] = people;
        }
        return id;
    }
}
