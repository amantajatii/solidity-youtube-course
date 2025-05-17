// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Tesla {
    struct Tesla { // Struct name corrected
        string name;
        uint256 year;
        string color;
    }

    Tesla[] public teslas;

    function addTesla(string memory name, uint256 year, string memory color) public {
        Tesla memory newTesla = Tesla({ // Matching struct name
            name: name,
            year: year,
            color: color
        });

        teslas.push(newTesla);
    }
}