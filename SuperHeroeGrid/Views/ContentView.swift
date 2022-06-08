//
//  ContentView.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var superheroesVM = SuperHeroeViewModel()
    let data = (1...10).map { "Item \($0)" }
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(data, id: \.self) { item in
                                    Text(item)
                                }
                }
            }.navigationBarTitle("SuperHeroe App", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
