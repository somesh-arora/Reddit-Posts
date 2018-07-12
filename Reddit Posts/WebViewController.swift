//
//  WebViewController.swift
//  Reddit Posts
//
//  Created by Somesh Arora on 7/12/18.
//  Copyright © 2018 Somesh Arora. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var webView: WKWebView!
    
    var receivedURL = ""
    override func viewDidLoad()
    {
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(tapButton))
        
//        navigationController?.title = "WebView"
//        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem .add, target: self, action: #selector(tapButton))
//        self.navigationItem.leftBarButtonItem = addButton
        
        
        
        print(receivedURL)
        let RedditBaseURL = URL(string: receivedURL)
        super.viewDidLoad()
        let request = URLRequest(url: RedditBaseURL!)
        webView.load(request)

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any)
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myVC = storyboard.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
        self.present(myVC, animated: true, completion: nil)
    }
    
    @objc func tapButton()
    {
        print("tapped")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
