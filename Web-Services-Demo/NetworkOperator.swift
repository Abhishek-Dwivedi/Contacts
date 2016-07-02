//
//  NetworkOperator.swift
//  Web-Services-Demo
//
//  Created by Abhishek Dwivedi on 10/06/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import Foundation

/*
Network Operator class downloads the data from a given URL and returns the JSON.
*/

struct NetworkOperator {
    
    var fetchURL: NSURL?
    
    init(URL: NSURL) {
        self.fetchURL = URL
    }
    
    func downloadUserData(completion: NSArray -> ()) {
        //config
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        //request
        let request = NSURLRequest(URL: self.fetchURL!)
        
        //session
        let session = NSURLSession(configuration: config)
        
        //task
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSArray
                completion(json!)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}