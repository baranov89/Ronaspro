//
//  TaskAnswerModel.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 26.01.2021.
//


import Foundation

struct TaskAnswerModel: Hashable {
    var id: String
    var parentTask: String
    var totalCost: Double
    var workNames: [String]
    var workCosts: [Double]
    
    
    var responsibleID: String
    var responsibleName: String
    var responsibleEmail: String
    var responsibleStaffPositon: StaffPosition
    
    var dictionary: [String: Any] {
        return ["id": id,
                "parentTask": parentTask,
                "totalCost": totalCost,
                "workNames": workNames,
                "workCosts": workCosts,
                "responsibleID": responsibleID,
                "responsibleName": responsibleName,
                "responsibleEmail": responsibleEmail,
                "responsibleStaffPositon": responsibleStaffPositon.rawValue,
        ]
    }
    
    init(id: String, parentTask: String, totalCost: Double, workNames: [String], workCosts: [Double], responsibleID: String, responsibleName: String, responsibleEmail: String, responsibleStaffPositon: StaffPosition) {
        self.id = id
        self.parentTask = parentTask
        self.totalCost = totalCost
        self.workNames = workNames
        self.workCosts = workCosts
        self.responsibleID = responsibleID
        self.responsibleName = responsibleName
        self.responsibleEmail = responsibleEmail
        self.responsibleStaffPositon = responsibleStaffPositon
    }
    
    init?(dictionary: [String: Any]) {
        var id: String
        var parentTask: String
        var totalCost: Double
        var workNames: [String]
        var workCosts: [Double]
        
        var responsibleID: String
        var responsibleName: String
        var responsibleEmail: String
        var responsibleStaffPositon: StaffPosition
       
        if let idInit = dictionary["id"] as? String {id = idInit} else {return nil}
        if let parentTaskInit = dictionary["parentTask"] as? String {parentTask = parentTaskInit} else {return nil}
        if let totalCostInit = dictionary["totalCost"] as? Double {totalCost = totalCostInit} else {totalCost = 0}
        if let workNamesInit = dictionary["workNames"] as? [String] {workNames = workNamesInit} else {workNames = []}
        if let workCostsInit = dictionary["workCosts"] as? [Double] {workCosts = workCostsInit} else {workCosts = []}
        
        if let responsibleIDInit = dictionary["responsibleID"] as? String {responsibleID = responsibleIDInit} else {return nil}
        if let responsibleNameInit = dictionary["responsibleName"] as? String {responsibleName = responsibleNameInit} else {return nil}
        if let responsibleEmailInit = dictionary["responsibleEmail"] as? String {responsibleEmail = responsibleEmailInit} else {return nil}
        
        if let responsibleStaffPositonInit = dictionary["responsibleStaffPositon"] as? String {
            if let staff = StaffPosition(rawValue: responsibleStaffPositonInit) {
        
                responsibleStaffPositon = staff
            } else { return nil }
        } else { return nil }
        
        self.init(id: id, parentTask: parentTask, totalCost: totalCost, workNames: workNames, workCosts: workCosts, responsibleID: responsibleID, responsibleName: responsibleName, responsibleEmail: responsibleEmail, responsibleStaffPositon: responsibleStaffPositon)
    }
}
