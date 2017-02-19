//
//  UIViewControllerExtension.swift
//  swift-firebase-demo
//
//  Created by Ray on 19/02/2017.
//  Copyright © 2017 Ray. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorMessagePrompt(message: String?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true);
    }
    
    func showSuccessMessagePrompt(message: String?) {
        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true);
    }
    
    func startLoading(message: String?) {
        let alertDialoag = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let indicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicatorView.hidesWhenStopped = true
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicatorView.startAnimating()
        alertDialoag.view.addSubview(indicatorView)
        self.present(alertDialoag, animated: true, completion: nil)
    }
    
    func stopLoading() {
        self.dismiss(animated: true, completion: nil)
    }
}
