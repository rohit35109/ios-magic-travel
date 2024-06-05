//
//  ViewController.swift
//  MagicTravel
//
//  Created by Rohit Kumar on 31/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    
    private var cityAndStates: [String: [String]] = [
        "TamilNadu": ["Chennai", "Madurai", "Coimbatur"],
        "Maharastra": ["Mumbai", "Pune"],
        "UttarPardesh": ["Prayagraj", "Noida", "Lakhnow"],
        "Delhi": ["Delhi"],
        "AndraPardesh": ["Hydrabad", "Vijaywada"],
        "Karnataka": ["Bangaluru"],
        "MadhyaPradesh": ["Gurugram"],
        "Punjab": ["Mohali", "Dharmashala"]
    ]
    
    @IBOutlet var countriesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
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
        tableView.deselectRow(at: indexPath, animated: true)
        let state = Array(cityAndStates.keys)[indexPath.section]
        let cityName = cityAndStates[state]?[indexPath.row] ?? ""
        print("User tapped on cell at \(indexPath) that is: \(cityName) | \(state)")
        
//        let detailViewController = UIViewController()
//        detailViewController.view.backgroundColor = .green
//        present(detailViewController, animated: true)
//        navigationController?.pushViewController(detailViewController, animated: true)
        
        performSegue(withIdentifier: "showCountryDetails", sender: self)
        
    }
}
