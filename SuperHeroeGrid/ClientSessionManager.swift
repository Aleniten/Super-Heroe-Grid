//
//  ClientSessionManager.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import Foundation

class ClientSessionManager {
    static let shared = ClientSessionManager()
    var heroes: [SuperHeroe]?
}
