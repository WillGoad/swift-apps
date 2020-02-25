//
//  ViewController.swift
//  CurrentWeatherDisplay
//
//  Created by Goad, William (PAH) on 09/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

struct BasicWeatherInfo : Decodable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}


struct WeatherData: Decodable {
    let coord: [String: Float]
    let weather: BasicWeatherInfo?
    let base: String
    let main: [String: Float]
    let visibility: Int
    let wind: [String: Float]
    let clouds: [String: Int]
    let dt: Int
    

    let id: Int
    let name: String
    let cod: Int

    

}

class ViewController: UIViewController {
    @IBOutlet var weatherDescrip: UILabel!
    @IBOutlet var temp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentData()
        
    }
    
    
    func getCurrentData() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=52c14c32eb6eaf9fa48a495035268b11") else {
            return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            
            do {
                let basicWeatherInfo = try JSONDecoder().decode(BasicWeatherInfo.self, from: data)
                
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            
        }.resume()
        
    }

}

