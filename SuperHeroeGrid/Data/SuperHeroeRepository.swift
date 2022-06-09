//
//  SuperHeroeRepository.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import Alamofire
import AlamofireObjectMapper

protocol SuperHeroeRepositoryProtocol {
    func getHeroes(success: @escaping ([SuperHeroe]) -> Void, error: @escaping () -> Void)
}

struct SuperHeroeRepository: SuperHeroeRepositoryProtocol {
    
    func getHeroes(success: @escaping ([SuperHeroe]) -> Void, error: @escaping () -> Void) {
            Alamofire.request(Constants.apiURL, method: .get).responseArray { (response: DataResponse<[SuperHeroe]>) in
                guard let superHeroesDto = response.value else {
                    error()
                    return
                }
                print("Success Call = \(superHeroesDto)")
                ClientSessionManager.shared.heroes = superHeroesDto
                success(superHeroesDto)
            }
    }
}
