//
//  SignUpViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 10/31/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController, UITextFieldDelegate  {

  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
  
  @IBAction func createAccountAction(_ sender: UIButton) {
  if emailTextField.text == "" {
        let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
    
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
    
        present(alertController, animated: true, completion: nil)
    
    } else {
    Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
          
            if error == nil {
                print("You have successfully signed up")
                //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
              
                if let user = Auth.auth().currentUser {
                  // Set uid and empty placeholder variables for personal profile
                  let uid = Auth.auth().currentUser!.uid
                  var username: String!
                  var height: Int!
                  var weight: Int!
                
                  username = "You need to set a Username"
                  height = 0
                  weight = 0
                  
                  let userRecord = ["username": username,
                                    "weight": weight,
                                    "height": height
                                    ] as [String: Any]
                  
                  self.ref.child("Users").child(uid).setValue(userRecord)


                
                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                  self.present(vc!, animated: true, completion: nil)
              }
            }
            else {
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
