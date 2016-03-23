//
//  UponLogin.swift
//  Flash
//
//  Created by Harshil on 08/03/16.
//  Copyright © 2016 Harshil Parikh. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UponLogin : UIViewController {
    
      var ref = Firebase(url:"https://blistering-inferno-6182.firebaseio.com")
    
    
    @IBOutlet weak var LoginWelcome: UILabel!
    var labeltext = String()
    @IBAction func unAuth(sender: AnyObject) {
        ref.unauth()
    }
    
    override func viewDidLoad() {

               LoginWelcome.text = labeltext
        
    }
}
