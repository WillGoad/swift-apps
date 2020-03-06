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
    let itunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    
    func updateArtistsByLocation(text: String?) {
        itunesAdaptor.getArtists(search: text) { (artists) in
        let names = artists?.map { return $0.artistName }
        self.musicRecommendations.text = names?.joined(separator: ", ")
    }
}
}
