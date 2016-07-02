//
//  WeatherService.swift
//  Web-Services-Demo
//
//  Created by Abhishek Dwivedi on 10/06/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import Foundation

/*
Weather Service class constructs the URL,
sends the URL to Network Operator class and gets back the 
JSON Dictionary. It then parses the JSON, models the data 
and returns back the Weather model object
*/

struct UserService {
    
    //URL
    private static let baseURL = "http://jsonplaceholder.typicode.com/users"
    
    //Constructs the URL
    private static func constructURL() -> NSURL? {
        //Base URL
        let userURLComponent = NSURLComponents(string: baseURL)
        
        //Returns the complete URL
        return(userURLComponent?.URL)
    }
    
    //Parses the received JSON, models the data and returns
    //the Weather model object
    // Parse the data, model it and send to VC.
    static func fetchAllUsers(completion: [User]? -> Void) {
        
        var user = User()
        var users = [User]()
        let url = constructURL()
        let nwOperator = NetworkOperator(URL: url!)
        nwOperator.downloadUserData { (array) -> Void in
            for item in (array as? [[String: AnyObject]])! {
                
                guard let name = item["name"] as? String,
                    let userEmail = item["email"] as? String,
                    let userName = item["username"] as? String,
                    let phone = item["phone"] as? String,
                    let website = item["website"] as? String,
                    let address = item["address"],
                    let company = item["company"]
                    else {
                        return
                }
                
                user.name = name
                user.userName = userName
                user.userEmail = userEmail
                user.phone = phone
                user.website = website
                user.address = address as? [String : AnyObject]
                user.company = company as? [String : String]
                
                users.append(user)
            }
            completion(users)
        }
    }
}