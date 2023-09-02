//
//  ReportAnswerRow.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 31.01.2021.
//

import SwiftUI

struct ReportAnswerRow: View {
    
    var user: MyUserModel
    var totalCost: String
    var fontWeight : Font.Weight
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(user.name)
                    .fontWeight(.semibold)
                Text(user.staffPositon.rawValue)
                    .fontWeight(.thin)
            }
            Spacer()
            Text(totalCost)
                .fontWeight(fontWeight)
                .multilineTextAlignment(.center)
                
        }
        .foregroundColor(Color(UIColor.label))
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(UIColor.secondarySystemBackground))
        )
        .clipped()
        .shadow(color: Color(UIColor.tertiaryLabel), radius: 4, x: 4, y: 4)
    }
}

