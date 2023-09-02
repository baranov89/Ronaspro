//
//  ChatRowView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 28.01.2021.
//

import SwiftUI

struct ChatRowView: View {
    
    @State var message: ChatMessageModel
    
    fileprivate func isCurrnetUser(message: ChatMessageModel)->Bool {
        return (message.userID == FbManager.Authenticaton.currentUser?.id)
    }
    
    var body: some View {
        HStack {
            if isCurrnetUser(message: message) {
                Spacer()
            }
            VStack(alignment: .leading) {
                if !isCurrnetUser(message: message) {
                    Text(message.userName)
                        .font(.system(size: 12, weight: .heavy, design: .default))
                }
                Text(message.text)
                    .multilineTextAlignment(.leading)
                Text(DateFormatter.localizedString(from: message.date, dateStyle: .none, timeStyle: .short))
                    .font(.system(size: 8, weight: .thin, design: .default))
            }
            .foregroundColor(.white)
            .padding(6)
            .background(isCurrnetUser(message: message) ? AppSettings.accentColor : Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
            .cornerRadius(10)
            if !isCurrnetUser(message: message) {
                Spacer()
            }
        }.id(message.id)
    }
}
