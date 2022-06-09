//
//  StrokeImage.swift
//  SuperHeroeGrid
//
//  Created by Jose Alejandro Herrero on 6/8/22.
//

import SwiftUI

struct StrokeImage: View {
    let imageName: String
    let width: CGFloat
    let color: Color
    let fontSize: CGFloat

    var body: some View {
        ZStack{
            ZStack{
                Image(systemName: imageName).offset(x:  width, y:  width)
                Image(systemName: imageName).offset(x: -width, y: -width)
                Image(systemName: imageName).offset(x: -width, y:  width)
                Image(systemName: imageName).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Image(systemName: imageName)
                .font(.system(size: fontSize))
        }
    }
}
