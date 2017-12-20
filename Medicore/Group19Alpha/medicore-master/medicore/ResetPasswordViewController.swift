//
//  ResetPasswordViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 10/31/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var emailTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        // Do any additional setup after loading the view.
    }
  
    //method to dismiss the keyboard when return key is hit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    //method to dismiss the keyboard when user touches anywhere on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
  @IBAction func resetPasswordAction(_ sender: Any) {
  if self.emailTextField.text == "" {
        let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
    
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
    
        present(alertController, animated: true, completion: nil)
    
    } else {
        Auth.auth().sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
          
            var title = ""
            var message = ""
          
            if error != nil {
                title = "Error!"
                message = (error?.localizedDescription)!
            } else {
                title = "Success!"
                message = "Password reset email sent."
                self.emailTextField.text = ""
            }
          
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
          
            self.present(alertController, animated: true, completion: nil)
        })
    }
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
