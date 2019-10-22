//
//  DetailedWeatherViewController.swift
//  FavWeatber
//
//  Created by Consultant on 10/11/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import  CoreLocation
class DetailedWeatherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var forecastData = [Weather]()

    @IBOutlet weak var detailedTableView: UITableView!
    @IBOutlet weak var temparature: UILabel!
    @IBOutlet weak var weatherToday: UILabel!
    var cityName = ""
    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                        
                        if let weatherData = results {
                            self.forecastData = weatherData
                            DispatchQueue.main.async {
                                self.detailedTableView.reloadData()
                            }
                            
                        }
                        
                    })
                }
            }
        }
    
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWeatherForLocation(location: cityName)
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return forecastData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
     
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: date!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailedTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let weatherObject = forecastData[indexPath.section]
        cell.textLabel?.text = weatherObject.summary
        cell.detailTextLabel?.text = "\(Int(weatherObject.temperature))"+"°F"
        cell.imageView?.image = UIImage(named: weatherObject.icon)
        
        
        if  indexPath.section == 0{
        
        temparature.text = String(weatherObject.temperature) + " °F"
        weatherToday.text = weatherObject.summary
        cityNameLabel.text = cityName
        }
        return cell
    }
    
    
    
    

}
