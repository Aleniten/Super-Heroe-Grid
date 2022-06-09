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
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        AsyncImage(
                            url: URL(string: heroe.images?.lg ?? ""),
                                        content: { image in
                                            image.resizable()
                                                 .aspectRatio(contentMode: .fill)
                                                 .frame(maxWidth: 200, maxHeight: 200)
                                                 .clipShape(Circle())
                                                 .clipped()
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                        
                        Text(heroe.name ?? "")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                        
                        Text(heroe.biography?.aliases?.first ?? "")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }.padding()
                    Spacer()
                }
              
            }.background(Color.blue)
        ScrollView(.vertical, showsIndicators: false) {
            Spacer(minLength: 50)
            VStack(spacing: 2) {
                Text("Apparance").font(.title2).fontWeight(.heavy).foregroundColor(Color.blue)
                Spacer(minLength: 10)
                HStack() {
                    SimpleHstackTwoVies(title:"Gender", description: heroe.appearance?.gender ?? "")
                    Spacer(minLength: 10)
                    SimpleHstackTwoVies(title:"Race", description: heroe.appearance?.race ?? "")
                }
                HStack() {
                    SimpleHstackTwoVies(title:"EyeColor", description: heroe.appearance?.eyeColor ?? "")
                    Spacer(minLength: 10)
                    SimpleHstackTwoVies(title:"HairColor", description: heroe.appearance?.hairColor ?? "")
                }
                HStack() {
                    SimpleHstackTwoVies(title:"Height", description: heroe.appearance?.height?.last ?? "")
                    Spacer(minLength: 10)
                    SimpleHstackTwoVies(title:"Weight", description: heroe.appearance?.weight?.last ?? "")
                }
            }
            Spacer(minLength: 30)
            VStack {
                Text("Biography").font(.title2).fontWeight(.heavy).foregroundColor(Color.blue)
                Spacer(minLength: 10)
                VStack(spacing: 0) {
                    SimpleHstackTwoVies(title:"FullName", description: heroe.biography?.fullName ?? "")
                    SimpleHstackTwoVies(title:"PlaceOfBirth", description: heroe.biography?.placeOfBirth ?? "")
                    SimpleHstackTwoVies(title:"AlterEgos", description: heroe.biography?.alterEgos ?? "")
                    SimpleHstackTwoVies(title:"Aliases", description: heroe.biography?.aliases?.first ?? "")
                    SimpleHstackTwoVies(title:"FirsAppearance", description: heroe.biography?.firstAppearance ?? "")
                    SimpleHstackTwoVies(title:"Publisher", description: heroe.biography?.publisher ?? "")
                }
            }
            Spacer(minLength: 50)
        }
    }
}


