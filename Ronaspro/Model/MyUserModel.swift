//
//  MyUserModel.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import Foundation

struct MyUserModel: Identifiable , Hashable{
    var id: String
    var email: String
    var name: String
    var staffPositon: StaffPosition
    
    var dictionary: [String: Any] {
        return ["id": id,
                "email": email,
                "name": name,
                "staffPositon": staffPositon.rawValue]
    }
    
    init(id: String, email: String, name: String, staffPositon: StaffPosition) {
        self.id = id
        self.email = email
        self.name = name
        self.staffPositon = staffPositon
    }
    
    init?(dictionary: [String: Any]) {
        var id: String
        var email: String
        var name: String
        var staffPositon: StaffPosition
       
        if let idInit = dictionary["id"] as? String {id = idInit} else {return nil}
        if let emailInit = dictionary["email"] as? String {email = emailInit} else {return nil}
        if let nameInit = dictionary["name"] as? String {name = nameInit} else {return nil}
        
        if let staffPositonInit = dictionary["staffPositon"] as? String {
            if let staff = StaffPosition(rawValue: staffPositonInit) {
                staffPositon = staff
            } else { return nil }
        } else { return nil }
        
        self.init(id: id, email: email, name: name, staffPositon: staffPositon)
    }
}
