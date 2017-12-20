//
//  SearchViewController.swift
//  medicore
//
//  Created by Khalil Manpuri on 12/7/17.
//  Copyright © 2017 Final Project. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    //This is the table view on the main storyboard that houses the cells
    @IBOutlet weak var TableView: UITableView!
  
    //Search Bar
    @IBOutlet weak var SearchBar: UISearchBar!
  
    //These are the temporary symptoms I've put in for testing purposes, will probably have to ping DB for actual info
    let data = ["Fatigue","Swelling","Nausea","Weight Loss", "Headache", "Fever", "Vomiting","Stress","Pain","Trouble Breathing","Depression",
                "Dizziness", "Cough", "Bleeding"]
  
    //This is the list of data that can be filtered through, dynamic as search bar query changes
  
    //And when done searching, need to put in hide keyboard function
    var filteredData: [String]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        SearchBar.delegate = self
        filteredData = data
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? DiseaseTableViewController{
            destination.symptom = filteredData[(TableView.indexPathForSelectedRow?.row)!]
        }
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
      
        TableView.reloadData()
    }
}

