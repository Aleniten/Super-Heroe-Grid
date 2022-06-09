//
//  SuperHeroe.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import ObjectMapper

class SuperHeroe: Identifiable, Mappable {
   
    var id: Int?
    var name: String?
    var slug: String?
    var powerStats: PowerStats?
    var appearance: Appearance?
    var biography: Biography?
    var images: HeroesImages?
    
    init(){}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        powerStats <- map["powerstats"]
        appearance <- map["appearance"]
        biography <- map["biography"]
        images <- map["images"]
    }
}

class PowerStats: Mappable {
    var intelligence: Int?
    var strenght: Int?
    var speed: Int?
    var durability: Int?
    var power: Int?
    var combat: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        intelligence <- map["intelligence"]
        strenght <- map["strength"]
        speed <- map["speed"]
        durability <- map["durability"]
        power <- map["power"]
        combat <- map["combat"]
    }
}

class Appearance: Mappable {
    var gender: String?
    var race: String?
    var height: [String]?
    var weight: [String]?
    var eyeColor: String?
    var hairColor: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        gender <- map["gender"]
        race <- map["race"]
        height <- map["height"]
        weight <- map["weight"]
        eyeColor <- map["eyeColor"]
        hairColor <- map["hairColor"]
    }
}

class Biography: Mappable {
    var fullName: String?
    var alterEgos: String?
    var aliases: [String]?
    var placeOfBirth: String?
    var firstAppearance: String?
    var publisher: String?
    var alignment: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        fullName <- map["fullName"]
        alterEgos <- map["alterEgos"]
        aliases <- map["aliases"]
        placeOfBirth <- map["placeOfBirth"]
        firstAppearance <- map["firstAppearance"]
        publisher <- map["publisher"]
        alignment <- map["alignment"]
    }
}

class HeroesImages: Mappable {
    var xs: String?
    var sm: String?
    var md: String?
    var lg: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        xs <- map["xs"]
        sm <- map["sm"]
        md <- map["md"]
        lg <- map["lg"]
    }
}
