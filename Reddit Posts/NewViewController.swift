//
//  NewViewController.swift
//  Reddit Posts
//
//  Created by Somesh Arora on 7/12/18.
//  Copyright © 2018 Somesh Arora. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    let RedditBaseURL = URL(string:"https://www.reddit.com/r")
    struct TopTierDataObject:Decodable
    {
        
        let data: ChildrenDataObject
    }
    
    struct ChildrenDataObject: Decodable
    {
        let children: [SubDataObject]
    }
    
    struct SubDataObject: Decodable
    {
        let data: SubRedditProperties
    }
    
    struct SubRedditProperties: Decodable
    {
        let title: String
        let subreddit: String
        let url: String
    }
    
    var posts = [SubDataObject]()
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let redditURL = "https://www.reddit.com/r/funny/.json"
        
        guard let url = URL(string: redditURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do
            {
                let toptier = try
                    JSONDecoder().decode(TopTierDataObject.self, from: data)
                self.posts = toptier.data.children
                print(self.posts[0].data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
            catch let jsonError
            {
                print("Error in serializing json",jsonError)
            }
            
            }.resume()
        
        

        // Do any additional setup after loading the view.
    }

    @objc func tapButton()
    {
        print("tapped")
    }
    func getPosts(subReddit:(String) -> Void)
    {
        if let completeURL = URL(string: "\(RedditBaseURL!)/\(subReddit)/.json")
        {
            //guard let url = URL(string: completeURL) else {return}
            
            URLSession.shared.dataTask(with: completeURL) { (data, response, error) in
                
                guard let data = data else {return}
                
                do
                {
                    let toptier = try
                        JSONDecoder().decode(TopTierDataObject.self, from: data)
                    self.posts = toptier.data.children
                    print(self.posts[0].data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                }
                catch let jsonError
                {
                    print("Error in serializing json",jsonError)
                }
                
                }.resume()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Title:  " + self.posts[indexPath.row].data.title
        cell.detailTextLabel?.text = "Subreddit:    " + self.posts[indexPath.row].data.subreddit
        navigationController?.title = self.posts[indexPath.row].data.subreddit
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        myVC.receivedURL = self.posts[(indexPath?.row)!].data.url
        self.present(myVC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func searchButton(_ sender: Any)
    {
        //print(searchTextField.text?.description)
        let subReddit = searchTextField.text
        
        if let completeURL = URL(string: "\(RedditBaseURL!)/\(subReddit ?? "funny")/.json")
        {
            print(completeURL)
            //guard let url = URL(string: completeURL) else {return}
            
            URLSession.shared.dataTask(with: completeURL) { (data, response, error) in
                
                guard let data = data else {return}
                
                do
                {
                    let toptier = try
                        JSONDecoder().decode(TopTierDataObject.self, from: data)
                    self.posts = toptier.data.children
                    print(self.posts[0].data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    
                }
                catch let jsonError
                {
                    print("Error in serializing json",jsonError)
                }
                
                }.resume()
        }
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
