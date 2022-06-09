//
//  SimpleHStackTwoViews.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/9/22.
//

import SwiftUI

struct SimpleHstackTwoVies: View {
    let title: String
    let description: String

    var body: some View {
        HStack {
            Text("\(title):").font(.headline).foregroundColor(Color.cyan)
            Text(description).font(.subheadline)
        }.padding()
        }
}
