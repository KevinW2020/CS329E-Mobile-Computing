//
//  ProfileViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/2/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {

    let user = Auth.auth().currentUser
    let uid = Auth.auth().currentUser!.uid
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var bmi: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        var ref: DatabaseReference!
      
        ref = Database.database().reference()
      
      ref.child("Users").child(uid).observe(.value) { (snapshot) in
        if let dataDict = snapshot.value as? [String: AnyObject]
        {
              let username = dataDict["username"] as! String
              let height = dataDict["height"] as! String
              let weight = dataDict["weight"] as! String
              self.username.text = username
              self.weight.text = weight
              self.height.text = height
              let bmicalculated = (Double(weight)! * 0.45)/pow((Double(height)! * 0.025),2.0)
              self.bmi.text = String(format:"%.1f",bmicalculated)
          }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    // MARK: - Navigation

}
