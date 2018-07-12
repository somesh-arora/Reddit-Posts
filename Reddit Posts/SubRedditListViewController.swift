//
//  SubRedditListViewController.swift
//  Reddit Posts
//
//  Created by Somesh Arora on 7/12/18.
//  Copyright © 2018 Somesh Arora. All rights reserved.
//

import UIKit

class SubRedditListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    let RedditBaseURL = URL(string:"https://www.reddit.com/.json")
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
        let subreddit: String
    }
    
    var posts = [SubDataObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let redditURL = "https://www.reddit.com/.json"
        
        guard let url = URL(string: redditURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            
            do
            {
                let toptier = try
                    JSONDecoder().decode(TopTierDataObject.self, from: data)
                self.posts = toptier.data.children
                
                print(self.posts)
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Title:  " + self.posts[indexPath.row].data.subreddit
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let indexPath = tableView.indexPathForSelectedRow
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
        myVC.receivedSubReddit = self.posts[(indexPath?.row)!].data.subreddit
        self.present(myVC, animated: true, completion: nil)
        
        
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
