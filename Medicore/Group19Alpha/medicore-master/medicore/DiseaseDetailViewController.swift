//
//  DiseaseDetailViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 11/21/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit

class DiseaseDetailViewController: UIViewController {
    var diseaseFinal:Disease?
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text = diseaseFinal?.Name
        for item in (diseaseFinal?.signal)!{
            Symp.text = Symp.text! + item
        }
        Symp.text = diseaseFinal?.signal[0]
        Desc.text = diseaseFinal?.Desc
        Cure.text = diseaseFinal?.Cure
      

        // Do any additional setup after loading the view.
    }

  @IBOutlet weak var Name: UILabel!
  @IBOutlet weak var Symp: UILabel!
  @IBOutlet weak var Desc: UILabel!
  @IBOutlet weak var Cure: UILabel!
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DoctorsTableViewController{
            destination.Specialty = diseaseFinal
        }
    }
        // Get the new view controller using segue.destinationViewController.
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

