//
//  ViewController.swift
//  Weather
//
//  Created by Jesse Tipton on 3/5/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var locationManager: CLLocationManager?
    
    func update(with forecast: Forecast) {
        label.text = """
        \(Int(forecast.currently.temperature.rounded()))°, feels like \(Int(forecast.currently.apparentTemperature.rounded()))°.
        It's \(forecast.currently.summary.lowercased()) out.
        """
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func loadWeatherData(for location: CLLocation) {
        let key = "e8c55c0f98eb3f15394d2a31e21726f1"
        let location = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
        let url = URL(string: "https://api.darksky.net/forecast/\(key)/\(location)")!
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let forecast = try decoder.decode(Forecast.self, from: data)
                DispatchQueue.main.async {
                    self.update(with: forecast)
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }
        dataTask.resume()
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            loadWeatherData(for: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }
    
}
