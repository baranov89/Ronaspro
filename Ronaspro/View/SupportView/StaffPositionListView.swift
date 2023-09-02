//
//  StaffPositionListView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI

struct StaffPositionListView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @Binding var poistion: StaffPosition
    
    var body: some View {
        List(StaffPosition.allCases, id:\.self) { item in
    
            HStack {
                Text(item.rawValue)
                Spacer()
                if poistion == item {
                    Image(systemName: "checkmark")
                }
            }.onTapGesture {
                poistion = item
                presentationMode.wrappedValue.dismiss()
            }
            
        }
        .padding()
    }
}

