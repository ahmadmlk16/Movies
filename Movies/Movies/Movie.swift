//
//  Movie.swift
//  Movies
//
//  Created by Mohsin on 4/20/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
 
struct Movie: Hashable, Codable, Identifiable {
   
    var id: UUID        // Storage Type: String, Use Type (format): UUID
    var title: String
    var posterFileName: String
    var overview: String
    var genres: String
    var releaseDate: String
    var runtime: Int
    var director: String
    var actors: String
    var mpaaRating: String
    var imdbRating: String
    var youTubeTrailerId: String
    var tmdbID: Double
}

struct Star: Hashable, Codable, Identifiable {
   
    var id: UUID        // Storage Type: String, Use Type (format): UUID
    var name: String
    var character: String
    var image: String
}
 
