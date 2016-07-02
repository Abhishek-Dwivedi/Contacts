//
//  Photo.swift
//  Web-Services-Demo
//
//  Created by Abhishek Dwivedi on 13/06/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import Foundation

struct Photo {
    static let sharedInstance = Photo()
    
    var url: String?
    var thumbnailURL: String?
}
