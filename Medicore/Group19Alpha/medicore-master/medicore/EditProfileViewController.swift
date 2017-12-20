//
//  EditProfileViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/2/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class EditProfileViewController: UIViewController {

    // Set user, uid, and rootRef to Database
    let user = Auth.auth().currentUser
    let uid = Auth.auth().currentUser!.uid
    var ref: DatabaseReference!
  
    
  
    // Connect the textFields
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
  
  
    // Save the text into the database
    @IBAction func saveAction(_ sender: Any) {
      if (username.text == "" || height.text == "" || weight.text == "")
        {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
        
            let alertController = UIAlertController(title: "Error", message: "Please do not leave any field empty", preferredStyle: .alert)
        
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
        
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            if (!isStringAnInt(string: height.text!) || !isStringAnInt(string: weight.text!)){
                //Alert to tell the user that there was an error because they didn't fill in numbers for height and weight
                let alertController = UIAlertController(title: "Error", message: "Please enter numbers for Height and Weight", preferredStyle: .alert)
            
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
            
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                let userRecord = [
                  "username": username.text! as String,
                  "height": height.text! as String,
                  "weight": weight.text! as String
                ] as [String : Any]
                self.ref.child("Users").child(uid).setValue(userRecord)
            }
        }
    }
  
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

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
