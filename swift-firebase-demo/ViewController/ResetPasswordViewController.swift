//
//  ResetPasswordViewController.swift
//  swift-firebase-demo
//
//  Created by Ray on 14/02/2017.
//  Copyright © 2017 Ray. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBAction func didTabReset(_ sender: Any) {
            resetPassword()
    }
    
    func resetPassword() {
        guard let email = accountTextField.text, !email.isEmpty else {
            self.showErrorMessagePrompt(message: "Email is empty")
            return
        }
        
        UserPreferences.setString(key: "email", value: email)
        self.startLoading(message: "Please wait")
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: {(error) in
            self.stopLoading()
            if let error = error {
                self.showErrorMessagePrompt(message: error.localizedDescription)
            } else {
                self.showSuccessMessagePrompt(message: "The email of resetting password has been sending to your email.")
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(vc!, animated: true, completion: nil)
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        accountTextField.text = UserPreferences.getString(key: "email")
        
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
