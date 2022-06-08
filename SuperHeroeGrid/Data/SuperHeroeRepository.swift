//
//  SuperHeroeRepository.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import Foundation

protocol SuperHeroeRepositoryProtocol {
    func getHeroes(city: [SuperHeroe], success: @escaping () -> Void, error: @escaping () -> Void)
}

struct SuperHeroeRepository: SuperHeroeRepositoryProtocol {
    
    let apiURL = "https://bitbucket.org/consultr/superhero-json-api/raw/4b787c39fcbfd8d069339de94bf8f3a6bda69f3e/superheros.json"
    
    func getHeroes(city: [SuperHeroe], success: @escaping () -> Void, error: @escaping () -> Void) {
        // Here I make the call
    }
}
