//
//  ReportView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 27.01.2021.
//

import SwiftUI

struct ReportView: View {
    
    @State var task: TaskModel
    @State var responsibleUsers = [MyUserModel]()
    @State var taskAnswers = [TaskAnswerModel]()
    @State var totalCost = 0.0
    
    
    fileprivate func sortAnswer(id: String)->TaskAnswerModel? {
        return taskAnswers.filter { $0.responsibleID == id }.first
    }
    
    var body: some View {
        
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color("tabBarColor").opacity(0.1), Color("tabBarColor").opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Проект:")
                            .fontWeight(.bold)
                        Text("Описание:")
                            .fontWeight(.thin)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text(task.title)
                            .fontWeight(.bold)
                        Text(task.description)
                            .fontWeight(.thin)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Сроки")
                        .fontWeight(.bold)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Начало:")
                                .fontWeight(.thin)
                            Text("Окончание:")
                                .fontWeight(.thin)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(DateFormatter.localizedString(from: task.dateAdded, dateStyle: .long, timeStyle: .short))
                                .fontWeight(.thin)
                            Text(DateFormatter.localizedString(from: task.dateEnd, dateStyle: .long, timeStyle: .short))
                                .fontWeight(.thin)
                        }
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Расчёты")
                        .fontWeight(.bold)
                    HStack {
                        Text("Общая стоимость")
                            .fontWeight(.thin)
                        Spacer()
                        Text(totalCost.description)
                            .fontWeight(.bold)
                        
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Работы")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.bottom, 4)

                    ScrollView {
                        ForEach(responsibleUsers, id:\.self) { user in
                            
                            if sortAnswer(id: user.id) != nil {
                                NavigationLink(destination: ReportDateilView(answer: sortAnswer(id: user.id)!)) {
                                    ReportAnswerRow(user: user, totalCost: sortAnswer(id: user.id)!.totalCost.description, fontWeight: .bold)
                                }
                                .padding(.bottom)
                            } else {
                                ReportAnswerRow(user: user, totalCost: "Не предоставил расчёт", fontWeight: .thin)
                                    .padding(.bottom)
                            }

                        }
                        .padding(.horizontal)
                    }

                }
                
                Spacer()
                
            }
            
            
        }
        .navigationTitle("Смета проекта")
        .onAppear() {
            FbManager.Docs.getResponsibleUsers(task: task) { (users, error) in
                responsibleUsers = users
            }
            FbManager.Docs.getAnswers(task: task) { (answers, error) in
                taskAnswers = answers
                totalCost = 0.0
                answers.forEach { ans in
                    totalCost += ans.totalCost
                }
//                FbManager.db.collection(FbManager.Collections.projects.rawValue).document(task.id)
//                    .updateData([FbManager.TaskFileds.totalCost.rawValue : totalCost])
            }
        }
    }
}
