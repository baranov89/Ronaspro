//
//  AppDelegate.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 24.01.2021.
//
//
//import UIKit 
//import FirebaseCore
//import UserNotifications
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        
//        FirebaseApp.configure()
//        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//            if success {
//                print("All set!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//        
//        return true
//    }
//}
