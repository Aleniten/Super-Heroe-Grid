//
//  SuperHeroeViewModel.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

class SuperHeroeViewModel: ObservableObject {
    @Published var superHeroes: [SuperHeroe] = []
    var repository = SuperHeroeRepository()
    func fetchHeroes() {
        repository.getHeroes(success: { response in
            self.superHeroes = response
        }, error: {
            
        })
    }
}
