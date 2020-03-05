//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Goad, William (PAH) on 05/03/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
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
