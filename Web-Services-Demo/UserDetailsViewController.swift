//
//  UserDetailsViewController.swift
//  Web-Services-Demo
//
//  Created by Abhishek Dwivedi on 13/06/16.
//  Copyright © 2016 Abhishek Dwivedi. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    var selectedUser = User()
    var selectedPhoto : Photo!
    
    @IBOutlet weak var userImageview: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UITextView!
    @IBOutlet weak var addressLabel: UITextView!
    
    @IBOutlet weak var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scroller.contentInset = UIEdgeInsetsMake(0, 0, 100, 0)
        setupUI()
    }

    func setupUI() {

        self.title = selectedUser.name
        self.navigationController!.navigationBar.barTintColor = UIColor.randomLightColor()
        if selectedPhoto != nil {
            
            let url = NSURL(string: selectedPhoto.url!)
            let data = NSData(contentsOfURL: url!)
            userImageview.image  = UIImage(data: data!)
        }

        usernameLabel.text = selectedUser.userName
        emailLabel.text = selectedUser.userEmail
        phoneLabel.text = selectedUser.phone
        websiteLabel.text = selectedUser.website
        let companyDetails = "\((selectedUser.company!["name"])!)\n\((selectedUser.company!["catchPhrase"])!)\n\((selectedUser.company!["bs"])!)"
        companyLabel.text = companyDetails
        
        let addressDetails = "\((selectedUser.address!["street"])!)\n\((selectedUser.address!["suite"])!)\n\((selectedUser.address!["city"])!)\n\((selectedUser.address!["zipcode"])!)"
        addressLabel.text = addressDetails
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
