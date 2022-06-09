//
//  HeroeDetails.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

struct HeroeDetails: View {
    var heroe: SuperHeroe

    var body: some View {
        Text(heroe.name ?? "")
    }
}

