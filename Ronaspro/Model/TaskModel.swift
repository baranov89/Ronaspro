//
//  TaskModel.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//


import Foundation
import FirebaseFirestore

struct TaskModel {
    var id: String
    var title: String
    var description: String
    var ownerID: String
    var dateAdded: Date
    var dateEnd: Date
    var responsibles: [String]
    var answers: [String: String]
    var totalCost: Double
    var files: Set<String>
    var dictionary: [String: Any] {
        return ["id": id,
                "title": title,
                "description": description,
                "ownerID": ownerID,
                "dateAdded": Timestamp(date: dateAdded),
                "dateEnd": Timestamp(date: dateEnd),
                "responsibles": responsibles,
                "answers": answers,
                "totalCost": totalCost,
                "files": Array(files) 
        ]
    }
    
    init(id: String, title: String, description: String, ownerID: String, dateAdded: Date, dateEnd: Date, responsibles: [String], answers: [String: String], totalCost: Double, files: Set<String>) {
        self.id = id
        self.title = title
        self.description = description
        self.ownerID = ownerID
        self.dateAdded = dateAdded
        self.dateEnd = dateEnd
        self.responsibles = responsibles
        self.answers = answers
        self.totalCost = totalCost
        self.files = files
    }
    
    init?(dictionary: [String: Any]) {
        var id: String
        var title: String
        var description: String
        var ownerID: String
        var dateAdded: Date
        var dateEnd: Date
        var responsibles: [String]
        var answers: [String: String]
        var totalCost: Double
        var files: Set<String>
       
        if let idInit = dictionary["id"] as? String {id = idInit} else {return nil}
        if let titleInit = dictionary["title"] as? String {title = titleInit} else {return nil}
        if let descriptionInit = dictionary["description"] as? String {description = descriptionInit} else {return nil}
        if let ownerIDInit = dictionary["ownerID"] as? String {ownerID = ownerIDInit} else {return nil}
        if let dateAddedInit = dictionary["dateAdded"] as? Timestamp {dateAdded = dateAddedInit.dateValue()} else {dateAdded = Date()}
        if let dateEndInit = dictionary["dateEnd"] as? Timestamp {dateEnd = dateEndInit.dateValue()} else {dateEnd = Date()}
        if let responsiblesInit = dictionary["responsibles"] as? [String] {responsibles = responsiblesInit} else {responsibles = [String]()}
        if let answersInit = dictionary["answers"] as? [String: String] {answers = answersInit} else {answers = [String: String]()}
        if let totalCostInit = dictionary["totalCost"] as? Double {totalCost = totalCostInit} else {totalCost = 0}
        if let filesInit = dictionary["files"] as? [String] {files = Set(filesInit)} else {files = Set<String>()}
        
        self.init(id: id, title: title, description: description, ownerID: ownerID, dateAdded: dateAdded, dateEnd: dateEnd, responsibles: responsibles, answers: answers, totalCost: totalCost, files: files)
    }
}
