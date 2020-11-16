//
//  ViewController.swift
//  MusicByLoc
//
//  Created by Goad, William (PAH) on 28/09/2020.
//

import UIKit
import CoreLocation


/*
 -Outlet
 -Action
 -Updating the display (using the outlet)
 -Requesting Location
 -Acting as the Location Manager Delegate (failure, location update events)
 -Making geocoder lookups
 -Web Requests DONE
 -Parsing JSON DONE
 -Tweaking response to get artist names
 */



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let iTunesAdaptor = ITunesAdaptor()
    
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
            geocoder.reverseGeocodeLocation(firstLocation,
                    completionHandler: { (placemarks, error) in
                        if error != nil {
                            self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                        } else {
                            if let firstPlacemark = placemarks?[0] {
                                self.iTunesAdaptor.getArtists(search: firstPlacemark.locality) { (artists) in
                                    let names = artists?.map { return $0.artistName }
                                    self.musicRecommendations.text = names?.joined(separator: ", ")
                                }
                            }
                        }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
    func getLocationBreakdown(placemark: CLPlacemark) -> String {
        return
            """
            Street: \(placemark.thoroughfare ?? "None")
            Area: \(placemark.administrativeArea ?? "None")
            Country: \(placemark.country ?? "None")
            """
    }
    
}

