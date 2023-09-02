//
//  MessageView.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI


struct ProjectView: View {
    
    @State var userTasks = [TaskModel]()
    @State var errorsMessage = ""
    @State private var getTaskBool = false
   
    fileprivate func getTasks() {
        if FbManager.Authenticaton.currentUser!.staffPositon == .manager {
            FbManager.Docs.addProjectListenerOwner(id: FbManager.Authenticaton.currentUser!.id) { (tasks, error) in
                userTasks = tasks
                if let taskError = error {
                    errorsMessage = taskError.localizedDescription
                }
                
            }
        } else {
            FbManager.Docs.addProjectListenerResponsible(id: FbManager.Authenticaton.currentUser!.id) { (tasks, error) in
                
                
                userTasks = tasks
                if let taskError = error {
                    errorsMessage = taskError.localizedDescription
                }

            }
        }
    }
    
    fileprivate func calcTaskTotalProgress(task: TaskModel)->Int {
        return  Int(round((Double(task.answers.count) / Double(task.responsibles.count)) * 100))
    }
    
    fileprivate func createProjectDetail(task: TaskModel)-> AnyView {
        if FbManager.Authenticaton.currentUser!.staffPositon == .manager {
            return AnyView(ReportView(task: task))
        } else {
            var answerView = AnyView(AnswerView(task: task))
            if checkAnswer(task: task) {
                answerView = AnyView(Text("Вы отправили расчёт"))
            }
            return answerView
        }
    }
    
    fileprivate func checkAnswer(task: TaskModel)->Bool {
        var check = false
        task.answers.forEach { answer in
            if answer.value == FbManager.Authenticaton.currentUser!.id {
                check = true
            }
        }
        return check
    }
    
    
    
    
    var body: some View {
        
        
        ScrollView {
            ForEach(userTasks, id:\.id) { task in
                NavigationLink(
                    destination: createProjectDetail(task: task),
                    label: {
                        HStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(DateFormatter.localizedString(from: task.dateAdded, dateStyle: .medium, timeStyle: .short))
                                    .font(.system(size: 10))
                                    .fontWeight(.thin)
                                Text("Проект \"\(task.title)\"")
                                    .fontWeight(.medium)
                                Text("Описание: \(task.description)")
                                    .font(.system(size: 12))
                                    .fontWeight(.thin)
                                    .lineLimit(1)
                                    .frame(width: AppSettings.screenWidth - 120, alignment: .leading)
                            }
                            .foregroundColor(Color(UIColor.label))
                            
                            Spacer()
                            
                            
                            
                            if FbManager.Authenticaton.currentUser!.staffPositon == .manager {
                                
                                ZStack {
                                    Circle()
                                        .stroke(lineWidth: 6)
                                    Circle()
                                        .trim(from: 0.0, to: CGFloat(calcTaskTotalProgress(task: task))/100)
                                        .stroke(style: StrokeStyle(lineWidth: 6,
                                                                   lineCap: .round,
                                                                   lineJoin: .round))
                                        .foregroundColor(.green)
                                    if !task.answers.isEmpty {
                                        Text("\(calcTaskTotalProgress(task: task))%" )
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(UIColor.label))
                                    } else {
                                        Text("0%" )
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(UIColor.label))
                                    }
                                }
                                .padding(4)
                                //.offset(x: AppSettings.screenWidth/6)
                            } else {
                                if checkAnswer(task: task) {
                                    IconImageView(image: "checkmark.circle.fill", color: Color.green, imageScale: 30)
                                        .shadow(color: Color(UIColor.tertiaryLabel), radius: 4, x: 4, y: 4)
                                        .padding(.trailing, 10)
                                } else {
                                    IconImageView(image: "exclamationmark.circle.fill", color: Color.yellow, imageScale: 30)
                                        .shadow(color: Color(UIColor.tertiaryLabel), radius: 4, x: 4, y: 4)
                                        .padding(.trailing, 10)
                                }
                            }
                            
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                        )
                        .clipped()
                        .shadow(color: Color(UIColor.tertiaryLabel), radius: 4, x: 4, y: 4)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
        
        .onAppear() {
            if !getTaskBool {
                getTasks()
                getTaskBool = true
            }
            
            
        }
    }
    
}
