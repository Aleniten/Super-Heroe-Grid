//
//  SuperHeroe.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

struct SuperHeroe: Identifiable {
    var id = UUID()
    var name: String
    var slug: String
    var powerStats: PowerStats
    var appearance: Appearance
    var biography: Biography
}

struct PowerStats {
    var intelligence: Int
    var strenght: Int
    var Speed: Int
    var durability: Int
    var power: Int
    var combat: Int
}

struct Appearance {
    var gender: String
    var race: String
    var height: [String]
    var weight: [String]
    var eyeColor: String
    var hairColor: String
}

struct Biography {
    var fullName: String
    var alterEgos: String
    var aliases: [String]
    var placeOfBirth: String
    var firstAppearance: String
    var publisher: String
    var alignment: String
}

struct heroesImages {
    var xs: String
    var sm: String
    var md: String
    var lg: String
}
