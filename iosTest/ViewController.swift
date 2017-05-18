//
//  ViewController.swift
//  iosTest
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    let url_to_request = "http://35.161.24.123/account/login"

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func submit(_ sender: Any) {
        if username.text != "" && password.text != ""{
            
            let url = NSURL(string: url_to_request)
            let session = URLSession.shared
            
            let request = NSMutableURLRequest(url: url! as URL)
            request.httpMethod = "POST"
            
            //let paramString = username.text
            
            let parameters = ["username": username.text, "password": password.text] as! Dictionary<String, String>

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            //request.httpBody = paramString?.data(using: String.Encoding.utf8)
            
            let task = session.dataTask(with: request as URLRequest){
                (data, response, error) in
                
                guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else{
                    print("error")
                    return
                }
                
                if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                    
                    print(dataString)
                    
                }
                
                
                
            }
            
            task.resume()
            
        }
    }

    
    
    

}

