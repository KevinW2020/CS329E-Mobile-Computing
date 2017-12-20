//
//  SettingsViewController.swift
//  SearchAndTabBar
//
//  Created by Wang, Kevin on 10/31/17.
//  Copyright © 2017 Wang, Kevin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  var numb:Int32 = 0
  @IBOutlet weak var changeColor: UISwitch!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  @IBAction func changeColor(_ sender: Any) {
      if changeColor.isOn {
            self.view.backgroundColor = UIColor.white
        }
          else {
            self.view.backgroundColor = UIColor.lightGray
        }
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
