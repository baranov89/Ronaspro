//
//  ChatMessageModel.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 28.01.2021.
//

import Foundation
import FirebaseFirestore

struct ChatMessageModel: Hashable, Equatable {
    static func == (lhs: ChatMessageModel, rhs: ChatMessageModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    var userName: String
    var userID: String
    var text: String
    var date: Date
    
    var dictionary: [String: Any] {
        return ["id": id,
                "userName": userName,
                "userID": userID,
                "text": text,
                "date": Timestamp(date: date)
        ]
    }
    
    init(id: String, userName: String, userID: String, text: String, date: Date) {
        self.id = id
        self.userName = userName
        self.userID = userID
        self.text = text
        self.date = date
    }
    
    init?(dictionary: [String: Any]) {
        var id: String
        var userName: String
        var userID: String
        var text: String
        var date: Date
        
        if let idInit = dictionary["id"] as? String {id = idInit} else {print(#line);return nil}
        if let userNameInit = dictionary["userName"] as? String {userName = userNameInit} else {print(#line);return nil}
        if let userIDInit = dictionary["userID"] as? String {userID = userIDInit} else {print(#line);return nil}
        if let textInit = dictionary["text"] as? String {text = textInit} else {print(#line);return nil}
        if let dateInit = dictionary["date"] as? Timestamp {date = dateInit.dateValue()} else {print(#line);return nil}
        
        self.init(id: id, userName: userName, userID: userID, text: text, date: date)
    }
    
}
