//
//  UponRegistration.swift
//  Flash
//
//  Created by Harshil on 07/03/16.
//  Copyright © 2016 Harshil Parikh. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UponRegistration: UIViewController {
    
    var ref = Firebase(url:"https://blistering-inferno-6182.firebaseio.com")
    @IBOutlet weak var user: UILabel!
    
   
    override func viewDidLoad() {

        
     ref.childByAppendingPath("user").queryOrderedByChild("username")
        .observeSingleEventOfType(.ChildAdded, withBlock: { snap in
          if let username = snap.value["username"] as? String {
                self.user.text = "Welcome to Flash, \(username) !"
                //print(username)
            }
            
            
        })
        
        
    }
}
