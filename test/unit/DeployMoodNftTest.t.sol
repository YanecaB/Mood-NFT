// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test{    
    DeployMoodNft public deployer;
    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+IDx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+PC9zdmc+";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="500"> <text x="0" y="15" fill="black">Hi! Your browser decoded this</text></svg>';

        string memory createdSvg = deployer.svgToImgUri(svg);

        assert(keccak256(abi.encodePacked(createdSvg)) == keccak256(abi.encodePacked(expectedUri)));
    }
}