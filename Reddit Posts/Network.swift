//
//  Network.swift
//  Reddit Posts
//
//  Created by Somesh Arora on 7/10/18.
//  Copyright © 2018 Somesh Arora. All rights reserved.
//

import Foundation


class Network
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    let url: URL
    
    init(url : URL)
    {
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([String : Any]?) -> Void)
    
    func downloadJSONFromURL(_completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let datatask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil
            {
                if let httpResponse = response as? HTTPURLResponse
                {
                    switch httpResponse.statusCode
                    {
                    case 200:
                        if let data = data
                        {
                            do
                            {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                _completion(jsonDictionary as? [String : Any])
                            }
                            catch let error as NSError
                            {
                                print("Error processing the data: \(error.localizedDescription)")
                            }
                            
                        }
                        
                    default:
                        print("HTTP Response Code: \(httpResponse.statusCode)")
                    }
                }
            }
            else
            {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        datatask.resume()
    }
    
}
