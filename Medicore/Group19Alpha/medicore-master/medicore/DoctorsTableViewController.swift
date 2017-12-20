//
//  DoctorsTableViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/7/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit

class DoctorsTableViewController: UITableViewController {
  
    var Specialty:Disease?
    var Doctors: [Doctor] = []
    var show: [Doctor] = []
  

    private func CreateDoctor(){
      
        let Anemia = Disease(Name: "Anemia")
        Anemia.signal += ["Dizziness","Fatigue","Weakness","Lightheadnedness"]
        Anemia.Desc = "Results from a lack of functional red blood cells in the body, resulting in less oxygen going to vital organs."
        Anemia.Cure = "Iron supplements, Vitamin B, Blood Transfusion"
      
        let BloodClot = Disease(Name: "Blood Clot")
        BloodClot.signal += ["Swelling", "Fatigue", "Pain"]
        BloodClot.Desc = "A clump of blood that has changed from liquid to solid/gel-like state, can be dangerous or even life threatening."
        BloodClot.Cure = "Go see a doctor...now"
      
        let HeartAttack = Disease(Name: "Heart Attack")
        HeartAttack.signal += ["Fatigue", "Pain", "Nausea", "Dizziness"]
        HeartAttack.Desc = "A blood clot that blocks flow of blood to the heart"
        HeartAttack.Cure = "You need a doctor ASAP. Call 911!"
      
        let Cancer = Disease(Name: "Cancer")
        Cancer.signal += ["Weight Loss", "Bleeding", "Fatigue", "Pain", "Cough", "Swelling", "Trouble Breathing"]
        Cancer.Desc = "Abnormal cells that divide uncontrolably and destroy healthy tissue."
        Cancer.Cure = "Kemo"
      
        let Mono = Disease(Name: "Mononucleosis (Mono)")
        Mono.signal += ["Fever", "Headache", "Pain", "Fatigue"]
        Mono.Desc = "The kissing disease"
        Mono.Cure = "Be careful whose mouth you stick your tounge in."
      
        let Virus = Disease(Name: "Virus")
        Virus.signal += ["Fever", "Pain", "Vomitting"]
        Virus.Desc = "Something hit you hard"
        Virus.Cure = "Hope it's not ebola"
      
        let Insomnia = Disease(Name: "Insomnia")
        Insomnia.signal += ["Stress", "Depression"]
        Insomnia.Desc = "Can't sleep"
        Insomnia.Cure = "Sleeping pills"
      
        let Einstein = Doctor(Name:"Dr. Albert Einstein")
        Einstein.Rating = [5,3,5,5,1]
        Einstein.Reviews = ["What a great doctor!", "Did alright"]
        Einstein.Special = [Anemia, Insomnia]
        Einstein.imageName = "Einstein.png"
      
        let Doom = Doctor(Name: "Dr. Doom")
        Doom.Rating = [2,1,4,2,3]
        Doom.Special = [HeartAttack,Cancer]
        Doom.imageName = "Doom.png"
      
        let Wayne = Doctor(Name: "Dr. Thomas Wayne")
        Wayne.Rating = [1,4,5,5,4]
        Wayne.Special = [BloodClot, HeartAttack]
        Wayne.imageName = "Wayne.png"
      
        let Bailey = Doctor(Name: "Dr. Miranda Bailey")
        Bailey.Rating = [5,5,5,5,5]
        Bailey.Special = [Mono,Virus,Insomnia]
        Bailey.imageName = "Bailey.png"
      
        let Grey = Doctor(Name: "Dr. Meredith Grey")
        Grey.Rating = [5,4,4,5,3]
        Grey.Special = [Mono,Virus, Cancer]
        Grey.imageName = "Grey.png"
      
        let Shepherd = Doctor(Name: "Dr. Derek Shepherd")
        Shepherd.Rating = [5,5,5,5,1]
        Shepherd.Special = [BloodClot, Virus, Insomnia]
        Shepherd.imageName = "Shepherd.png"
      
        Doctors += [Einstein, Doom, Wayne, Bailey, Grey, Shepherd]
      
        for item in Doctors{
            for counter in item.Special{
                if counter.Name == Specialty?.Name{
                    show.append(item)
                }
            }
        }
      
      
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateDoctor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return show.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Doctor", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = show[indexPath.row].Name
      
        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DoctorDetailViewController{
            destination.Chosen = show[(tableView.indexPathForSelectedRow?.row)!]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
