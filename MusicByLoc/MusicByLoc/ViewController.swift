//
//  ViewController.swift
//  MusicByLoc
//
//  Created by Goad, William (PAH) on 28/09/2020.
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
            geocoder.reverseGeocodeLocation(firstLocation,
                    completionHandler: { (placemarks, error) in
                        if error != nil {
                            self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                        } else {
                            if let firstPlacemark = placemarks?[0] {
                                self.musicRecommendations.text = self.getLocationBreakdown(placemark: firstPlacemark)
                                let theFirstPlacemark = firstPlacemark.locality!
                                self.getArtists(term: theFirstPlacemark)
                                //Fix the above so it calls get artists using the placemark as the search term. Then watch from start of MLB3.
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
    
    func getArtists(term: String) -> String {
        let theTerm = term.filter { !$0.isWhitespace }
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(theTerm)&entity=musicArtist")
        else {
            print("Invalid URL")
            return "Invalid URL. Wasn't able to search ITunes."
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ",")
                    }
                }
            }
        }.resume()
        
        return ""
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }
    
}

