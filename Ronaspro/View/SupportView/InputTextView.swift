//
//  InputTextView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI

struct InputTextView: View {
    
    var title: String
    var titleDescription: String
    var keyboardType: UIKeyboardType
    var autocapitalization: UITextAutocapitalizationType
    
    @Binding var text: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 12, weight: .regular, design: .default))
            TextField(titleDescription, text: $text)
                .keyboardType(keyboardType)
                .autocapitalization(autocapitalization)
                .disableAutocorrection(true)
            Divider()
        }
    }
}
