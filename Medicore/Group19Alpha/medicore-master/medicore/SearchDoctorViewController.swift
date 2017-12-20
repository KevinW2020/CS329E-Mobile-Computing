//
//  SearchDoctorViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/7/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit

class SearchDoctorViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate  {

    @IBOutlet weak var Display: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    let data = ["Dr. Albert Einstein", "Dr. Doom", "Dr. Thomas Wayne", "Dr. Miranda Bailey", "Dr. Meredith Grey", "Dr. Derek Shepherd"]
    var filteredData:[String] = []
    var Doctors:[Doctor] = []
  
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
    }
  
    override func viewDidLoad() {
        CreateDoctor()
        super.viewDidLoad()
        Display.dataSource = self
        SearchBar.delegate = self
        filteredData = data

        // Do any additional setup after loading the view.
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Doc", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
  
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
      
        Display.reloadData()
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DoctorDetailViewController{
            for item in Doctors{
                if filteredData[(Display.indexPathForSelectedRow?.row)!] == item.Name!{
                    destination.Chosen = item
                }
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

