// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Create a Twitter Contract 
// 2️⃣ Create a mapping between user and tweet 
// 3️⃣ Add function to create a tweet and save it in mapping
// 4️⃣ Create a function to get Tweet 
// 5️⃣ Add array of tweets 

contract Twitter {

    uint16 constant MAX_TWEET_LENGTH = 280;

        struct Tweet {
            address author;
            string content;
            uint256 timestamp;
            uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Your tweet is too long!");
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint _i) public view returns(Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweet(address _owner) public view returns(Tweet[] memory){
        return tweets[_owner];
    }

}