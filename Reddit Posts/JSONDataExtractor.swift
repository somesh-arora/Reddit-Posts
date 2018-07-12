//
//  JSONDataExtractor.swift
//  Reddit Posts
//
//  Created by Somesh Arora on 7/10/18.
//  Copyright © 2018 Somesh Arora. All rights reserved.
//

import Foundation


class JSONDataExtractor
{
    let title: String?
    let subreddit: String?
    let url: String?
    
    struct APIKeys
    {
        static let title = "title"
        static let subreddit = "subreddit"
        static let url = "url"
    }
    init(redditDictionary: [String: Any])
    {
        title = redditDictionary[APIKeys.title] as? String
        subreddit = redditDictionary[APIKeys.subreddit] as? String
        url = redditDictionary[APIKeys.url] as? String
    }
}
