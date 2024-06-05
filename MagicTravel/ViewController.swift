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
    
    private var states: [String] = [
        "TamilNadu", "UttarPardesh", "Punjab", "Karnataka",
        "AndraPardesh", "MadhyaPardesh"
    ]
    
    private var city: [String: String] = [
        "TamilNadu": "Chennai",
        "UttarPardesh": "Lukhanow",
        "Punjab": "Mohali",
        "Karnataka": "Bengaluru",
        "AndraPardesh": "Heydrabad",
        "MadhyaPardesh": "Gurugram"
    ]
    
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
    
    func isEven(num: Int) -> Bool {
        return num % 2 == 0
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let state = Array(cityAndStates.keys)[section]
//        return cityAndStates[state]?.count ?? 0
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let stateName = states[indexPath.row]
        cellContentConfiguration.text = stateName
        cellContentConfiguration.secondaryText = city[stateName]
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let state = states[indexPath.row]
        print("User tapped on cell at \(indexPath) that is: \(state) | \(city[state] ?? "")")
        
        let detailViewController = UIViewController()
        let isRowEven: Bool = isEven(num: indexPath.row)
        
        if (indexPath.row + 1) == states.count {
            performSegue(withIdentifier: "showCountryDetails", sender: self)
        } else if isRowEven {
            detailViewController.view.backgroundColor = .blue
            present(detailViewController, animated: true)
        } else if !isRowEven {
            detailViewController.view.backgroundColor = .green
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
}
