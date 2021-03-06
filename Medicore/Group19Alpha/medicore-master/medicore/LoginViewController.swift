//
//  LoginViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 10/31/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate  {


  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
  
  @IBAction func loginAction(_ sender: Any) {
   if self.emailTextField.text == "" || self.passwordTextField.text == "" {
    
        //Alert to tell the user that there was an error because they didn't fill anything in the textfields 
    
        let alertController = UIAlertController(title: "Error", message: "Please enter an email and password", preferredStyle: .alert)
    
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
    
        self.present(alertController, animated: true, completion: nil)
    
    } else {
    
    Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
          
            if error == nil {
              
                //Print into the console if successfully logged in
                print("You have successfully logged in")
              
                //Go to the HomeTabBarController if the login is sucessful
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
              self.present(vc, animated: true, completion: nil)
              
            } else {
              
                //Tells the user that there is an error and then gets firebase to tell them the error
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
              
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
              
                self.present(alertController, animated: true, completion: nil)
            }
        }
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
