//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Goad, William (PAH) on 28/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                } else {
                    self.musicRecommendations.text =
                        """
                    Finer Street Detail: \(placemarks?[0].subThoroughfare ?? "")
                    Street: \(placemarks?[0].thoroughfare ?? "")
                    Sub Locality: \(placemarks?[0].subLocality ?? "")
                    Locality: \(placemarks?[0].locality ?? "")
                    Postcode: \(placemarks?[0].postalCode ?? "")
                    
                    
                    """
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
}

