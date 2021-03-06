// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Hello_world
 * @dev Store & retrieve value in a variable
 * Task1 - Hello world
 * Yaroshuk Vladislav
 */
contract Hello_world {

    uint256 number;
    
    event dataStored(uint num);

    /**
     * @dev Store value in variable
     * @param _num value to store
     * dataStored event
     */
    function store(uint256 _num) public {
        number = _num;
        emit dataStored(_num);
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}