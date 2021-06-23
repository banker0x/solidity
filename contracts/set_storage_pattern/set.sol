pragma solidity 0.5.16;

contract Set {

    // Create an array of items
    bytes32[] public items;

    // 1-based indexing into the array. 0 represents non-existence.
    mapping(bytes32 => uint256) indexOf;

    function add(bytes32 value) public {

        // If the mapping has a value of 0, the item is not in the array
        if (indexOf[value] == 0) {
            items.push(value);

            // The very first item will have index value of 1 (not 0)
            indexOf[value] = items.length;
        }
    }

    // TODO: write tests
    function get(bytes32 value) public returns (bytes32) {
        uint256 index = indexOf[value];

        require(index > 0);

        return items[index];
    }

    function remove(bytes32 value) public {
        uint256 index = indexOf[value];

        // ensure that the item has been previously inserted into the array
        require(index > 0);

        // move the last item into the index being vacated
        bytes32 lastValue = items[items.length - 1];
        items[index - 1] = lastValue;  // adjust for 1-based indexing
        indexOf[lastValue] = index;

        // Reduce the number of items in the array
        items.length -= 1;

        // Reset the index of that value
        indexOf[value] = 0;
    }

    function contains(bytes32 value) public view returns (bool) {
        return indexOf[value] > 0;
    }

    function count() public view returns (uint256) {
        return items.length;
    }
}