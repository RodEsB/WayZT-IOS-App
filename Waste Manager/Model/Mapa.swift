//
//  Mapa.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 02/03/24.
//

import Foundation

struct Mapa: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let category: [String]
    let rating: Float
    
    init(id: String, name: String, category: [String], rating: Float) {
        self.id = id
        self.name = name
        self.category = category
        self.rating = rating
    }
}
