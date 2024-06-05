//
//  ViewController.swift
//  MagicTravel
//
//  Created by Rohit Kumar on 31/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countriesTableView: UITableView!
    
    var countries: [String] = ["Germay", "France", "India", "China", "Australia", "America", "UK", "Maxico", "Pakistan", "Bangladesh"]
    
    var continentCountryMapping: [String: String] = ["Germay": "Europe", "France": "Europe", "India": "Asia", "China": "Asia", "Australia": "Australia", "Brazil": "South America", "Canada": "North America", "Maxico": "North America", "Pakistan": "Asia", "Bangladesh": "Asia"]
    
    var cityAndStates: [String: [String]] = [
        "TamilNadu": ["Chennai", "Madurai", "Coimbatur"],
        "Maharastra": ["Mumbai", "Pune"],
        "UttarPardesh": ["Prayagraj", "Noida", "Lakhnow"],
        "Delhi": ["Delhi"],
        "AndraPardesh": ["Hydrabad", "Vijaywada"],
        "Karnataka": ["Bangaluru"],
        "MadhyaPradesh": ["Gurugram"],
        "Punjab": ["Mohali", "Dharmashala"]
    ]
    
    
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

        // if you want to give programmatically you can use below
        // countriesTableView.dataSource = self
        // countriesTableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let state = Array(cityAndStates.keys)[section]
        return cityAndStates[state]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cityAndStates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let state = Array(cityAndStates.keys)[indexPath.section]
        let cityName = cityAndStates[state]?[indexPath.row] ?? ""
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = state
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped on cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
