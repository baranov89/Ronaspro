//
//  InputPasswordView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI

struct InputPasswordView: View {
    
    var title: String
    var titleDescription: String
    @State var hidePass: Bool
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 12, weight: .regular, design: .default))
            HStack {
                if hidePass {
                    SecureField(titleDescription, text: $password)
                    .frame(height: 20)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                } else {
                    TextField(titleDescription, text: $password)
                    .frame(height: 20)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }
                Button(action: {
                    hidePass.toggle()
                }, label: {
                    Image(systemName: hidePass ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(hidePass ? Color.secondary : Color.accentColor)
                })
            }
            Divider()
        }
    }
}
