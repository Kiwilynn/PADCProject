//
//  ViewControllerLogIn.swift
//  CoffeeAppForUser
//
//  Created by Oliver Kramer on 23/04/2020.
//  Copyright © 2020 Kea. All rights reserved.
//

import UIKit

class ViewControllerProfile: UIViewController {

    var authManager: AuthorizationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authManager = AuthorizationManager.init(parentVC: self)
        
        if authManager.auth.currentUser == nil{
            showLogInOption()
        }
        // Do any additional setup after loading the view.
    }
    

    func showLogInOption(){
        // Creates a new viewcontroller which slides up from the bottom
        let logInViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "logIn") as ViewControllerLogin
        
        // A 'UIView' was created on the new view controller in the storyboard, and moved to the bottom of the view controller
        // The background of the pop up view controllers opacity is set to 0 and the presentation style is set to 'over current context' to make sure it's on top of the old view
        // This makes the rest of the view controller 'invisible' aka. when the 'UIView' pops up, the rest of the view controller isn't visible
        logInViewController.modalPresentationStyle = .overCurrentContext

        
        // The new view is presented on top of the old view controller
        present(logInViewController, animated: true, completion: {
            // When tapping outside of the view, the pop up will be dismissed
            logInViewController.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }
    
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }

}
