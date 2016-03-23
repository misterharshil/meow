//
//  ViewController.swift
//  Flash
//
//  Created by Harshil on 07/03/16.
//  Copyright © 2016 Harshil Parikh. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref = Firebase(url:"https://blistering-inferno-6182.firebaseio.com")
    @IBOutlet weak var flash: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   
    @IBOutlet weak var foot: UILabel!
    
    // LOGIN FUNCTION
    @IBAction func login(sender: AnyObject) {
        ref.authUser(email.text!, password: password.text!, withCompletionBlock: { error, authData in
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
                let uid = authData.uid
                print("Successful Login with UID :  \(uid)")
                self.performSegueWithIdentifier("ifloggedin", sender: self)
            }
            
        })
    }
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foot.text = "Made with kittens in mind  " + String(format: "%C", 0xe04f)
        
        // Animating the top label
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.flash.center = CGPoint(x: 360,y:100)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func errorCall(let msg: String) {
       let alert = UIAlertController(title: "Warning", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
        // Showing the popup
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let desc : UponLogin = segue.destinationViewController as! UponLogin
        desc.labeltext = "Welcome back, " +  email.text!
        
    }
    

}

