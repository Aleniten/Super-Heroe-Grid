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
                    ForEach(superheroesVM.superHeroes) { heroe in
                        HeroeView(heroe: heroe)
                    }
                }
            }.navigationBarTitle("SuperHeroe App", displayMode: .inline)
                .onAppear(perform: {
                    superheroesVM.fetchHeroes()
                })
                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Menu(content: {
                                            Button("Sort by name", action: {
                                                superheroesVM.sortByName()
                                            })
                                            Button("Sort by Intelligence", action: {
                                                superheroesVM.sortByIntelligence()
                                            })
                                            Button("Sort by Strength", action: {
                                                superheroesVM.sortByStrength()
                                            })
                                            Button("Sort by Speed", action: {
                                                superheroesVM.sortBySpeed()
                                            })
                                            Button("Sort by Durability", action: {
                                                superheroesVM.sortByDurability()
                                            })
                                            Button("Sort by Power", action: {
                                                superheroesVM.sortByPower()
                                            })
                                            Button("Sort by Combat", action: {
                                                superheroesVM.sortByCombat()
                                            })
                                        }) {
                                            Image(systemName: "ellipsis.circle")
                                                .font(.system(size: 14))
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
