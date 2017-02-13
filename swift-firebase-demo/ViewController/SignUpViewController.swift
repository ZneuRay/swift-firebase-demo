//
//  SignUpViewController.swift
//  swift-firebase-demo
//
//  Created by Ray on 13/02/2017.
//  Copyright © 2017 Ray. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signupButton(_ sender: UIButton) {
        createAccount()
    }
    
    func createAccount() {
        if accountTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please input account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true)
        } else if passwordTextField.text == "" {
            let alertController = UIAlertController(title: "error", message: "Please input password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true)
        } else {
            let email = accountTextField.text!
            UserPreferences.setString(key: "email", value: email)
            FIRAuth.auth()?.createUser(withEmail: email, password: passwordTextField.text!, completion: { (user, error) in
                if error == nil {
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
            
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
