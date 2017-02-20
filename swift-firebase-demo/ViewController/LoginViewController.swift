//
//  LoginViewController.swift
//  swift-firebase-demo
//
//  Created by Ray on 14/02/2017.
//  Copyright © 2017 Ray. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTabLogin(_ sender: Any) {
        login()
    }
    
    func login() {
        guard let email = self.accountTextField.text, !email.isEmpty, let password = self.passwordTextField.text, !password.isEmpty else {
            self.showErrorMessagePrompt(message: "Email or password can't be empty.")
            return
        }
        
        UserPreferences.setString(key: "email", value: email)
        
        
        self.startLoading(message: "登入中，請稍後")
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            self.stopLoading()
            if let error = error {
                self.showErrorMessagePrompt(message: error.localizedDescription)
            } else {
                self.showSuccessMessagePrompt(message: "Logged in")
                
            }
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let email = UserPreferences.getString(key: "email")
        accountTextField.text = email
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
