//
//  SuperHeroeViewModel.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import Foundation

class SuperHeroeViewModel: ObservableObject {
    @Published var superHeroes: [SuperHeroe] = []
    @Published var isLoading = false
    
    var sortedBy: SortedType?
    var superHeroesDtO: [SuperHeroe]?
    var repository = SuperHeroeRepository()
    
    // MARK: - Functions for fetching Heroes
    
    // Func for fetching heroes first see if there is in ClientSession if not call api
    func fetchHeroes(success: @escaping () -> Void, error: @escaping () -> Void) {
        guard let heroesAlreadyFetched = ClientSessionManager.shared.heroes else {
            callRepository(success: {
                success()
            }, error: {
                error()
            })
            return
        }
        self.superHeroesDtO = heroesAlreadyFetched
        self.superHeroes = heroesAlreadyFetched
        success()
    }
    
    // Func for calling api
    func callRepository(success: @escaping () -> Void, error: @escaping () -> Void) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.repository.getHeroes(success: { response in
                self.superHeroesDtO = response
                self.superHeroes = response
                self.isLoading = false
                success()
            }, error: {
                self.isLoading = false
                error()
            })
        })
    }
    
    // MARK: - Functions for Sorting the elements
    func sortByName() {
        if let superHeroesDtO = superHeroesDtO {
            superHeroes = superHeroesDtO
            sortedBy = .sortByName
        }
    }
    
    func sortByIntelligence() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.intelligence ?? 0 > $1.powerStats?.intelligence ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortByIntelligence
        }
    }
    func sortByStrength() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.strenght ?? 0 > $1.powerStats?.strenght ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortByStrength
        }
    }
    func sortBySpeed() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.speed ?? 0 > $1.powerStats?.speed ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortBySpeed
        }
    }
    func sortByDurability() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.durability ?? 0 > $1.powerStats?.durability ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortByDurability
        }
    }
    func sortByPower() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.power ?? 0 > $1.powerStats?.power ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortByPower
        }
    }
    func sortByCombat() {
        if let superHeroesDtO = superHeroesDtO {
            let sortedArray = superHeroesDtO.sorted(by: { $0.powerStats?.combat ?? 0 > $1.powerStats?.combat ?? 0 })
            superHeroes = sortedArray
            sortedBy = .sortByCombat
        }
    }
    
    // MARK: - Functions for delete elements
    func deleteHeroe(id: Int) {
        if let superHeroesDtO = superHeroesDtO {
            if let indexToDelete = superHeroesDtO.firstIndex(where: { $0.id == id }) {
                var temporaryArray = superHeroesDtO
                temporaryArray.remove(at: indexToDelete)
                self.superHeroesDtO = temporaryArray
                ClientSessionManager.shared.heroes = temporaryArray
                switch sortedBy {
                    case .sortByName:
                        self.sortByName()
                    case .sortByIntelligence:
                        self.sortByIntelligence()
                    case .sortByStrength:
                        self.sortByStrength()
                    case .sortBySpeed:
                        self.sortBySpeed()
                    case .sortByDurability:
                        self.sortByDurability()
                    case .sortByPower:
                        self.sortByPower()
                    case .sortByCombat:
                        self.sortByCombat()
                    case .none:
                        self.sortByName()
                }
            }
        }
    }
    
}

enum SortedType {
    case sortByName
    case sortByIntelligence
    case sortByStrength
    case sortBySpeed
    case sortByDurability
    case sortByPower
    case sortByCombat
}
