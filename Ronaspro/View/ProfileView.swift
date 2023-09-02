//
//  ProfileView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @State var user: MyUserModel
    @State var showAddTaskView = false
    
    var body: some View {
        VStack {
            Text(user.staffPositon.rawValue)
                .font(.title2)
                .padding()
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(.secondary)
            
            Text(user.name)
                .font(.largeTitle)
                .padding()
            Text(user.email)
                
            Spacer()
            
            if FbManager.Authenticaton.currentUser!.staffPositon == .manager {
                Button(action: {
                    showAddTaskView = true
                }, label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color(red: 51/255, green: 47/255, blue: 93/255))
                })
                .padding(.bottom, 30)
            }
            
            
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddProjectView()
        })
    }
}


