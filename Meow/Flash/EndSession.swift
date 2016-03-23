//
//  EndSession.swift
//  Flash
//
//  Created by Harshil on 07/03/16.
//  Copyright © 2016 Harshil Parikh. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class EndSession: UIViewController {
    
    var ref = Firebase(url:"https://blistering-inferno-6182.firebaseio.com")
    
    @IBAction func EndSession(sender: AnyObject) {
        // logging the user out
        ref.unauth() 
            
        
        // sending back to login screen 
        
    }
    override func viewDidLoad() {
        
    }
}
