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
    uint256 public participanteConut;

    constructor() {
        participanteConut = 0;
    }

    function addParticipante(string memory _email) public {
        Pessoas[participanteConut] = Pessoa(
            participanteConut,
            _email,
            msg.sender
        );
        participanteConut++;
    }

    function getPessoas() public view returns (Pessoa[] memory) {
        Pessoa[] memory id = new Pessoa[](participanteConut);
        for (uint256 i = 0; i < participanteConut; i++) {
            Pessoa storage people = Pessoas[i];
            id[i] = people;
        }
        return id;
    }
}
