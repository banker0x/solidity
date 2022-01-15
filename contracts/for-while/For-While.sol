// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Loop {

    function loop() public pure {
        
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }

        // do while loop
        uint z;
        do {
            z++;
        } while (z < 5);
    }
}
