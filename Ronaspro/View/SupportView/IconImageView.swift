//
//  TaskImageView.swift
//  Buman
//
//  Created by Baranov Alexey on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct IconImageView: View {
    
    var image: String
    var color: Color
    var imageScale: CGFloat
    
    var body: some View {
        
        ZStack {
            //color
            //LinearGradient(gradient: Gradient(colors: [color.opacity(0.5), color]), startPoint: .top, endPoint: .bottom)
            Image(systemName: image)
                .font(Font.system(size: imageScale))
                .foregroundColor(color)
                .background(Color.white)
               
        }
        .frame(width: imageScale, height: imageScale)
        .clipShape(Circle())
    }
}
