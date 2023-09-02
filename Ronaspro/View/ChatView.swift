//
//  ChatView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 28.01.2021.
//

import SwiftUI

struct ChatView: View {
    
    @State var chatMessages: [ChatMessageModel] = []
    @State var textMessage = ""
    
    @State var alertTitle = "Ошибка"
    @State var alertMessage = ""
    @State var alertShow = false

    var body: some View {
        
        VStack {
            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack {
                        ForEach(chatMessages, id:\.id) { message in
                            ChatRowView(message: message)
                        }
                    }
                    .onChange(of: chatMessages.count) { _ in
                        scrollProxy.scrollTo(chatMessages.last?.id, anchor: .bottom)
                    }
                    
                }
                
            }

            
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .frame(maxHeight: 30)
                        .foregroundColor(Color(UIColor.systemGray6))
                    TextField("Сообщение", text: $textMessage)
                        .padding(.horizontal, 4)
                }
                Button(action: {
                    
                    if textMessage != "" {
                        FbManager.Chats.sendMessageToChatRomsStatic(message: ChatMessageModel(
                                                                        id: UUID().uuidString,
                                                                        userName: FbManager.Authenticaton.currentUser!.name,
                                                                        userID: FbManager.Authenticaton.currentUser!.id,
                                                                        text: textMessage,
                                                                        date: Date())) { error in
                            if let messageError = error {
                                alertMessage = "Сообщение не отправлено! Ошибка: " + messageError.localizedDescription
                                alertShow = true
                            } else {
                                textMessage = ""
                            }
                        }
                    }
                    
                    
                }, label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(AppSettings.accentColor)
                })
            }
            .padding(.vertical)
            
        }
        .padding(.horizontal)
        
        .alert(isPresented: $alertShow, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel(Text("OK")))
        })
        
        .onAppear() {
            FbManager.Chats.shareRoomListener { updateMessages in
                chatMessages = updateMessages
            }
        }
        
        
    }
}

