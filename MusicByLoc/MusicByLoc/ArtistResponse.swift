//
//  ArtistResponse.swift
//  MusicByLoc
//
//  Created by Goad, William (PAH) on 05/11/2020.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results 
    }
}
