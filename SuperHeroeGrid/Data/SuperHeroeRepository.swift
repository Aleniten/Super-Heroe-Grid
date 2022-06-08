//
//  SuperHeroeRepository.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol SuperHeroeRepositoryProtocol {
    func getHeroes(success: @escaping ([SuperHeroe]) -> Void, error: @escaping () -> Void)
}

struct SuperHeroeRepository: SuperHeroeRepositoryProtocol {
    
    let apiURL = "https://bitbucket.org/consultr/superhero-json-api/raw/4b787c39fcbfd8d069339de94bf8f3a6bda69f3e/superheros.json"
    
    func getHeroes(success: @escaping ([SuperHeroe]) -> Void, error: @escaping () -> Void) {
        // Here I make the call
        Alamofire.request(apiURL, method: .get).responseArray { (response: DataResponse<[SuperHeroe]>) in
            guard let superHeroesDto = response.value else {
                error()
                return
            }
            print("Success Call = \(superHeroesDto)")
            let fourItems = Array(superHeroesDto.prefix(4))
            success(fourItems)
        }
    }
}
