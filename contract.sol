// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnvironmentalMonitoring {
    // Struct to store environmental data
    struct EnvironmentalData {
        uint256 timestamp;
        string sensorType;
        int256 value;
    }

    // Mapping to store environmental data by campus location
    mapping(string => EnvironmentalData[]) public environmentalDataByLocation;

    // Event to log data entry
    event DataLogged(string location, string sensorType, int256 value, uint256 timestamp);

    // Function to log environmental data
    function logEnvironmentalData(
        string memory location,
        string memory sensorType,
        int256 value
    ) public {
        EnvironmentalData memory newData = EnvironmentalData({
            timestamp: block.timestamp,
            sensorType: sensorType,
            value: value
        });

        environmentalDataByLocation[location].push(newData);

        emit DataLogged(location, sensorType, value, block.timestamp);
    }

    // Function to retrieve environmental data by location
    function getEnvironmentalData(string memory location)
        public
        view
        returns (EnvironmentalData[] memory)
    {
        return environmentalDataByLocation[location];
    }
}
