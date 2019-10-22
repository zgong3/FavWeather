//
//  AddCityViewController.swift
//  FavWeatber
//
//  Created by Consultant on 10/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
let cities = ["Los Angeles",
              "New York",
              "Chicago",
              "Houston",
              "Phoenix",
              "Philadelphia",
              "San Antonio",
              "San Diego",
              "Dallas",
              "San Jose",
              "Austin",
              "Jacksonville",
              "Columbus",
              "San Francisco",
              "Charlotte",
              "Seattle",
              "Indianapolis",
              "Denver",
              "Boston",
              "El Paso",
              "Detroit",
              "Nashville",
              "Memphis",
              "Portland",
              "Miami"]

let defaults = UserDefaults.standard

var remaining_cities = [String]()

class AddCityViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  remaining_cities.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return remaining_cities[row]
    }

    @IBAction func AddCityTapped(_ sender: Any) {
        
        
        let state = pickerViewOutlet.selectedRow(inComponent: 0)
        cities_in_table.append(remaining_cities[state])
        print(remaining_cities[state])
        defaults.set(cities_in_table, forKey: "Cities")
        defaults.synchronize()
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for each in cities{
            if !(cities_in_table.contains(each)){
                remaining_cities.append(each)
            }
        }
        self.pickerViewOutlet.dataSource = self
        self.pickerViewOutlet.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
}
