////
////  APICall.swift
////  Reddit Posts
////
////  Created by Somesh Arora on 7/10/18.
////  Copyright © 2018 Somesh Arora. All rights reserved.
////
//
//import Foundation
//
//class APICall
//{
//    let RedditBaseURL:  URL?
//
//    // forecaseBaseURL/forecaseAPIKey/latitude, longitude
//
//    init(APIKey: String)
//    {
//        RedditBaseURL = URL(string: "https://www.reddit.com/r/")
//    }
//
//    func getPosts(subReddit: String, completion: @escaping (JSONDataExtractor?) -> Void)
//    {
//        if let CompleteURL = URL(string: "\(RedditBaseURL!)/\(subReddit)/.json")
//        {
//            let network = Network(url: CompleteURL)
//            network.downloadJSONFromURL (_completion: { (jsonDictionary) in
//
//                if let redditAll = (try? JSONSerialization.jsonObject(with: Datar, options: <#T##JSONSerialization.ReadingOptions#>))
//
//
//
//
//
//                if let currentDictionary = jsonDictionary?["data"]!["children"]["{"]["data"] as? [AnyObject]
//                {
//                    let currentPosts = JSONDataExtractor(redditDictionary: currentDictionary)
//                    completion(currentPosts)
//                }
//                else
//                {
//                    completion(nil)
//                }
//            })
//        }
//    }
//}
