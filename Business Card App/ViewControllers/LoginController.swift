//
//  LoginController.swift
//  Business Card App
//
//  Created by Kristina's account on 8/31/20.
//  Copyright © 2020 Kristina's account. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var newUserBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
            // Do any additional setup after loading the view.
            setUpElements()
    }
        
    func setUpElements() {
        
        //hide error label
        errorLabel.alpha = 0
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleFilledButton(loginBtn)
        Utilities.styleHollowButton(newUserBtn)
    }
        
    

    @IBAction func loginTapped(_ sender: Any) {
        
        guard let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty else {
                
                print("Missing field data")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
        
            guard error == nil else {
                //showCreateAccount()
                return
            }
            
            print("You have signed in")
        })
    }
    
    func showCreateAccount() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
