//
//  ViewController.swift
//  BrunchMasterApp
//
//  Created by Zatar on 5/17/19.
//  Copyright © 2019 Abstract. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        // Get all auth UI object and specify defualt
        // let providers: [FUIAuthProvider] = [
            // FUIEmailAuth(authUI: FUIAuth.defaultAuthUI()),
            // FUIGoogleAuth(),
            // FUIFacebookAuth(),
            // FUIPhoneAuth,
            // ]
        //self.authUI?.providers = providers
        
        
        // Get the defualt auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            //log the error
            return
        
        }
        
        // Set ourselves as the delegate
        
        // This is deprecated and update
        authUI?.delegate = self
        
        // With this
        authUI?.providers = [FUIEmailAuth()]
        
        
        // Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        // Show it
        present(authViewController, animated: true, completion: nil)
        
        
        
    }
    
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
         // handle user (`authDataResult.user`) and error as necessary
        
        // Check if there was an error
        if error != nil {
            //log error
            return
        }
        //If you want to get a users uid from FireStore
        // authDateResult.user.uid
        // This allows you to check database side to decide where to send them next. i.g. setup wizard, or account
        
        performSegue(withIdentifier: "goSettings", sender: self)
    }
    

}

