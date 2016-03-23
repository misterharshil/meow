//
//  Register.swift
//  Flash
//
//  Created by Harshil on 07/03/16.
//  Copyright © 2016 Harshil Parikh. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Register: UIViewController {
   
    var ref = Firebase(url:"https://blistering-inferno-6182.firebaseio.com")
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var foot: UILabel!
    
    
    @IBAction func register(sender: AnyObject) {
        
        
        ref.createUser(email.text!, password: password.text!, withValueCompletionBlock: { error, result in
            if error != nil {
                if let errorC = FAuthenticationError(rawValue: error.code) {
                    switch(errorC) {
                    case .UserDoesNotExist:
                        self.errorCall("User does not exist!")
                    case .InvalidEmail:
                        self.errorCall("Invalid Email!")
                    case .InvalidPassword:
                        self.errorCall("Invalid Password")
                    default:
                        print("Something occured, Please retry in a bit!")
                    }
                }
            }
            else
            {
                let uid = result["uid"] as! String
                print("User created with UID: \(uid)")
                
               let username = ["username" : self.username.text!]
                self.ref.childByAppendingPath("user/\(uid)").setValue(username)
                 self.performSegueWithIdentifier("newuser", sender: self)
                
                
            }
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foot.text = "Made with kittens in mind  " + String(format: "%C", 0xe04f)
   
    }
    func errorCall(let msg: String) {
        let alert = UIAlertController(title: "Warning", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        // Showing the popup
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

