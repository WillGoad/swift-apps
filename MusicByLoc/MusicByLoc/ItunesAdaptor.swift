//
//  ItunesAdaptor.swift
//  MusicByLoc
//
//  Created by Goad, William (PAH) on 11/11/2020.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: @escaping ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided, terminating request")
            return
        }
        
        let path = "/term\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + path)
        else {
            print("Invalid URL. Not able to update recommended artists")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }
}
//Minute 11 MLB3 8 - Once completed Video 8, check if 3 errors exist, if they do then fix them using code review tool. If they don't commit to Github and then move to next vid.
