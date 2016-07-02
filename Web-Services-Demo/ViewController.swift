//
//  ViewController.swift
//  Web-Services-Demo
//
//  Created by Abhishek Dwivedi on 08/06/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import UIKit

/*
ViewController gets the data from WeatherService and displays in UI.
*/

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var usersArray : [User] = [User](){
        didSet {
            usersTableview.reloadData()
        }
    }
    
    var photosArray : [Photo] = [Photo](){
        didSet {
            usersTableview.reloadData()
        }
    }
    
    @IBOutlet weak var usersTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Users"
        self.navigationController!.navigationBar.barTintColor = UIColor.randomLightColor()
        
        //Get the user data from Weather Service
        UserService.fetchAllUsers { (users) -> Void in
            
            if let users = users {
                //Get the main thread to update the UI
                dispatch_async(dispatch_get_main_queue()) {
                    self.usersArray = users
                }
            }
        }
        
        //Get photos
        PhotoService.fetchAllPhotos { (photos) -> Void in
            
            if let photos = photos {
                //Get the main thread to update the UI
                dispatch_async(dispatch_get_main_queue()) {
                    //let photosArray = photos[0..<self.usersArray.count]
                    self.photosArray = photos
                    if (self.usersArray.count > 0) {
                        let photosArray = photos.prefix(self.usersArray.count)
                        self.photosArray = Array(photosArray)
                    }
                    else {
                        return
                    }
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.randomColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()

        cell.textLabel?.text = usersArray[indexPath.row].name
        cell.detailTextLabel?.text = usersArray[indexPath.row].userName
        
        if photosArray.count > 0 {
            
            let url = NSURL(string: photosArray[indexPath.row].thumbnailURL!)
            let data = NSData(contentsOfURL: url!)
            cell.imageView?.image  = UIImage(data: data!)?.circleMask
        }

        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let row = self.usersTableview.indexPathForSelectedRow?.row
            let vc = segue.destinationViewController as? UserDetailsViewController
            vc?.selectedUser = usersArray[row!]
            if photosArray.count > 0{
                vc?.selectedPhoto = photosArray[row!]
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}