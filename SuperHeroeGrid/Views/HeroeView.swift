//
//  HeroeView.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

struct HeroeView: View {
    var heroe: SuperHeroe
    @State var isHidden = false
    var superheroesVM: SuperHeroeViewModel?
    
    var body: some View {
        if isHidden {
                Button( action: {
                    isHidden.toggle()
                }) {
                    Text("Image Hidden")
                        .font(.system(size: 14))
                }.frame(height: 200,alignment: .center)
        } else {
        ZStack {
            AsyncImage(url: URL(string: heroe.images?.sm ?? ""))
           VStack {
               HStack {
                   Button( action: {
                       isHidden.toggle()
                   }) {
                       StrokeImage(imageName: "eye.slash.fill", width: 0.5, color: .white, fontSize: 14)
                   }
                   
                   Button( action: {
                       superheroesVM?.deleteHeroe(id: heroe.id ?? 0)
                   }) {
                       StrokeImage(imageName: "minus.circle.fill", width: 0.5, color: .white, fontSize: 14)
                           .foregroundColor(.red)
                   }
               }.frame(width: 150, alignment: .topTrailing)
               Spacer().frame(height: 140)
                VStack {
                    StrokeText(text: heroe.name ?? "", width: 0.5, color: .black)
                    .foregroundColor(.white)
                    .font(.headline)
                    StrokeText(text: "Height: \(heroe.appearance?.height?.last ?? "")", width: 0.5, color: .black)
                    .foregroundColor(.white)
                    .font(.headline)
                    StrokeText(text: "Weight: \(heroe.appearance?.weight?.last ?? "")", width: 0.5, color: .black)
                    .foregroundColor(.white)
                    .font(.headline)
                }
           }.frame(width: 180, alignment: .leading)
            }
        }
    }
}
