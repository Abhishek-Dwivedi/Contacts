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

struct PhotoService {
    
    //URL
    private static let baseURL = "http://jsonplaceholder.typicode.com/photos"
    
    //Constructs the URL
    private static func constructURL() -> NSURL? {
        //Base URL
        let photoURLComponent = NSURLComponents(string: baseURL)
        
        //Returns the complete URL
        return(photoURLComponent?.URL)
    }
    
    //Parses the received JSON, models the data and returns
    //the Weather model object
    // Parse the data, model it and send to VC.
    static func fetchAllPhotos(completion: [Photo]? -> Void) {
        
        var photo = Photo()
        var photos = [Photo]()
        let url = constructURL()
        let nwOperator = NetworkOperator(URL: url!)
        nwOperator.downloadUserData { (array) -> Void in
            for item in (array as? [[String: AnyObject]])! {
                
                guard let url = item["url"] as? String,
                    let thumbnailURL = item["thumbnailUrl"] as? String
                    else {
                        return
                }
                
                photo.url = url
                photo.thumbnailURL = thumbnailURL
                
                photos.append(photo)
            }
            completion(photos)
        }
    }
}