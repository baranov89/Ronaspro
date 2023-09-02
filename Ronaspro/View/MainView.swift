//
//  MainView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 24.01.2021.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(Color("tabBarColor"))
    }
    
    @Environment(\.presentationMode) private var presentationMode

    @State var selectedTab = 1
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedTab) {
                ProjectView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Проекты")
                    }
                    .tag(0)
                if let user = FbManager.Authenticaton.currentUser {
                    ProfileView(user: user)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Профиль")
                        }
                        .tag(1)
                }
                
                ChatView()
                    .tabItem {
                        Image(systemName: "envelope.fill")
                        Text("Сообщения")
                    }
                    .tag(2)
            }
            .accentColor(.white)
            .navigationBarItems(
                    leading:
                        BigLogoView(width: AppSettings.NavigationBar.logoSize, height: AppSettings.NavigationBar.logoSize, font: Font.system(size: 10), textPadding: 0, textLogo: "РОНАССМЕТА")
                        .offset(x: AppSettings.screenWidth/2 - AppSettings.NavigationBar.logoSize * 2)
                       ,
                    trailing:
                        Button("Выход") {
                            FbManager.Authenticaton.logOut { result in
                                switch result {
                                case .success(_):
                                    presentationMode.wrappedValue.dismiss()
                                case .failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                            
                        }
                )
        }
    }
}

