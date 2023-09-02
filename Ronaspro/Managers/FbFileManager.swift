//
//  FbFileManager.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 29.01.2021.
//

import Foundation
import FirebaseStorage

struct FbFileManager {
    static let storage = Storage.storage().reference()
    static let tastFileStorage = storage.child(FbFileManager.Folder.tasksFiles.rawValue)
    private static let pathForSaveLocalLibrary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    private static func pathForSaveTaskFileFolder(taskID: String)->URL {
        return
            pathForSaveLocalLibrary
                .appendingPathComponent("taskFiles")
                .appendingPathComponent("Task_\(taskID)")
    }
    private static func pathForSaveTaskFile(taskID: String, fileName: String)->URL {
        return pathForSaveTaskFileFolder(taskID: taskID).appendingPathComponent(fileName)
    }
    
    enum Folder: String {
        case tasksFiles
    }
    
    static func putFile(taskID: String, fileName: String, url: URL, completion: @escaping(StorageMetadata?, Error?)->Void) {
        tastFileStorage.child("Task_\(taskID)").child(fileName).putFile(from: url, metadata: nil) { (meta, error) in
            completion(meta, error)
        }
        
    }
    static func downloadFile(taskID: String, fileName: String, completion: @escaping(URL?, Error?)->Void) {
        
        tastFileStorage.child("Task_\(taskID)").child(fileName).write(toFile: pathForSaveTaskFile(taskID: taskID, fileName: fileName)) { (localURL, error) in
            completion(localURL, error)
        }
    }
    
}
