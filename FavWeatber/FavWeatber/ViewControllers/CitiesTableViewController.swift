//
//  CitiesTableViewController.swift
//  FavWeatber
//
//  Created by Consultant on 10/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit



var cities_in_table = [String]()


class CitiesTableViewController: UITableViewController {
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let  temp =  defaults.object(forKey: "Cities") as? [String] else {
            print("nothing predefined")
            return
        }
        
        cities_in_table = temp
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let  temp =  defaults.object(forKey: "Cities") as? [String] else {
            print("nothing predefined")
            return
        }
        
        cities_in_table = temp
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (cities_in_table.count)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cities_in_table[indexPath.row]
        
        
        return cell
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailedWeatherViewController
        
        destination?.cityName = cities_in_table[(tableView.indexPathForSelectedRow?.row)!]

        
        
        
        
    }
    
    
}
