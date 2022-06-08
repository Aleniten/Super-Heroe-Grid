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
                    ForEach(superheroesVM.superHeroes) { item in
                        ZStack {
                            AsyncImage(url: URL(string: item.images?.sm ?? ""))
                            VStack {
                                StrokeText(text: item.name ?? "", width: 0.5, color: .black)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                StrokeText(text: "Height: \(item.appearance?.height?.last ?? "")", width: 0.5, color: .black)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                StrokeText(text: "Weight: \(item.appearance?.weight?.last ?? "")", width: 0.5, color: .black)
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }.frame(width: 150, height: 210, alignment: .bottomLeading)
                        }
                    }
                }
            }.navigationBarTitle("SuperHeroe App", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    superheroesVM.fetchHeroes()
                }, label: {
                    Text("Fetch Heroes")
                }))
                .onAppear(perform: {
                    superheroesVM.fetchHeroes()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
