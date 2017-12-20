//
//  DoctorDetailViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/7/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit

class DoctorDetailViewController: UIViewController {

    var Chosen:Doctor?
  
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Rating: UILabel!
  
    override func viewDidLoad() {
        let ScreenSize = UIScreen.main.bounds
        let x1 = ScreenSize.width*0.5-50
        let y1 = ScreenSize.height*0.2
      
        let picture = UIImage(named: (Chosen?.imageName)!)
        let Image = UIImageView(image: picture)
        Image.frame = CGRect(x:x1,y:y1,width:100, height:200)
        Image.contentMode = .scaleAspectFit
        view.addSubview(Image)
      
        Name.text = Chosen?.Name
      
        var avg = 0
        var sum = 0
        for count in (Chosen?.Rating)!{
            sum += count
        }
        avg = sum/(Chosen?.Rating.count)!
        super.viewDidLoad()
        let avgstr = String(avg)
        Rating.text = avgstr + "/5"
        
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

