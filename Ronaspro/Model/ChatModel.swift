//
//  ChatRoomModel.swift
//  Ronaspro
//
//  Created by Sergey Volkov on 28.01.2021.
//

import Foundation

class ChatModel: Identifiable {
    var id: String
    var title: String
    var creatorID: String
    var creationDate: Date
    var members: [String]
    
    var dictionary: [String: Any] {
        return ["id": id,
                "title": title,
                "creatorID": creatorID,
                "creationDate": creationDate,
                "members": members
        ]
    }
    
    init(id: String, title: String, creatorID: String, creationDate: Date, members: [String]) {
        self.id = id
        self.title = title
        self.creatorID = creatorID
        self.creationDate = creationDate
        self.members = members
    }
    
    convenience init?(dictionary: [String: Any]) {
        var id: String
        var title: String
        var creatorID: String
        var creationDate: Date
        var members: [String]
        
        if let idInit = dictionary["id"] as? String {id = idInit} else {return nil}
        if let titleInit = dictionary["title"] as? String {title = titleInit} else {return nil}
        if let creatorIDInit = dictionary["creatorID"] as? String {creatorID = creatorIDInit} else {return nil}
        if let creationDateInit = dictionary["creationDate"] as? Date {creationDate = creationDateInit} else {return nil}
        if let membersInit = dictionary["members"] as? [String] {members = membersInit} else {return nil}
        
        self.init(id: id, title: title, creatorID: creatorID, creationDate: creationDate, members: members)
    }
}
