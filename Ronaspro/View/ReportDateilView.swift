//
//  ReportDateilView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 30.01.2021.
//

import SwiftUI

struct ReportDateilView: View {
    
    @State var answer: TaskAnswerModel
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {

                    Text("Работы:")
                        .fontWeight(.bold)
                    ForEach(answer.workNames.indices, id: \.self) { index in
                        HStack {
                            Text(answer.workNames[index])
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Text(answer.workCosts[index].description)
                                .fontWeight(.bold)
                        }
                        
                        
                    }
                }
                
            }
            
            Spacer()
            HStack {
                Text("Итого:")
                Spacer()
                Text(answer.totalCost.description)
            }
            .font(.system(size: 20, weight: .bold, design: .default))
        }
        .navigationTitle(Text(answer.responsibleName))
        .padding()
    }
}
