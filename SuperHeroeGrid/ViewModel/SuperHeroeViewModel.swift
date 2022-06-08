//
//  SuperHeroeViewModel.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

class SuperHeroeViewModel: ObservableObject {
    @Published var superHeroes: [SuperHeroe] = []
    var superHeroesDtO: [SuperHeroe]?
    var repository = SuperHeroeRepository()
    
    func fetchHeroes() {
        repository.getHeroes(success: { response in
            self.superHeroesDtO = response
            self.superHeroes = response
        }, error: {
            
        })
    }
    
    func sortByName() {
        if let superHeroesDtO = superHeroesDtO {
            superHeroes = superHeroesDtO
        }
    }
    
    func sortByIntelligence() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.intelligence ?? 0 > $1.powerStats?.intelligence ?? 0 })
            superHeroes = sortedArray
        }
    }
    func sortByStrength() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.strenght ?? 0 > $1.powerStats?.strenght ?? 0 })
            superHeroes = sortedArray
        }
    }
    func sortBySpeed() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.speed ?? 0 > $1.powerStats?.speed ?? 0 })
            superHeroes = sortedArray
        }
    }
    func sortByDurability() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.durability ?? 0 > $1.powerStats?.durability ?? 0 })
            superHeroes = sortedArray
        }
    }
    func sortByPower() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.power ?? 0 > $1.powerStats?.power ?? 0 })
            superHeroes = sortedArray
        }
    }
    func sortByCombat() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.combat ?? 0 > $1.powerStats?.combat ?? 0 })
            superHeroes = sortedArray
        }
    }
}
