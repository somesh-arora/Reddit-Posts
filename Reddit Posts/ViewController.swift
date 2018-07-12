////
////  ViewController.swift
////  Reddit Posts
////
////  Created by Somesh Arora on 7/10/18.
////  Copyright © 2018 Somesh Arora. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var subredditTextField: UITextField!
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        let apiCall = APICall(APIKey: subredditTextField.text!)
//        apiCall.getPosts(subReddit: subredditTextField.text!) { (JSONDataExtractor) in
//            if let JSONDataExtractor = JSONDataExtractor
//            {
//                DispatchQueue.main.async {
//                    if let title = JSONDataExtractor.title
//                    {
//
//                    }
//                    else
//                    {
//
//                    }
//                    if let subreddit = JSONDataExtractor.subreddit
//                    {
//
//                    }
//                    else
//                    {
//
//                    }
//                    if let url = JSONDataExtractor.url
//                    {
//
//                    }
//                    else
//                    {
//
//                    }
//                }
//            }
//        }
//    }
//
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @IBAction func searchButton(_ sender: Any)
//    {
//
//    }
//
//}
//
