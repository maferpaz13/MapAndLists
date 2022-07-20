//
//  AppDelegate.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 8/06/22.
//

import UIKit
import GoogleMaps
import FirebaseCore
import SwiftyJSON
import UserNotifications

let googleApiKey = "AIzaSyCBWrh4VhKqAaEt-5_Jw9jZmBHTRXEEsEM"

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().delegate = self
        GMSServices.provideAPIKey(googleApiKey)
        FirebaseApp.configure()
        
        requestAuthorizationForPushNotifications(application: application)
        handleNotificationWhenAppIsKilled(launchOptions)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    private func requestAuthorizationForPushNotifications(application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    
                    if let error = error { print("D'oh: \(error.localizedDescription)") } else {
                        
                        DispatchQueue.main.async(execute: { application.registerForRemoteNotifications() })
                        
                    }
                    
                }
       }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
            
            print("me llego un push normal")
            let json = JSON(userInfo)
            var body = ""
            
            if json["aps"]["alert"]["body"].stringValue != ""{
                
                body = json["aps"]["alert"]["body"].stringValue
                
            }else{
                
                body = json["aps"]["alert"].stringValue
                
            }
            //let title = json["aps"]["alert"]["title"].stringValue
            print("la info del push 2 \(json)")
        
        }
    
    func handleNotificationWhenAppIsKilled(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
            
            if let remoteNotification = launchOptions?[.remoteNotification] as?  [AnyHashable : Any] {
                
                let json = JSON(remoteNotification)
                print("i im here")
                var body = ""
                
                if json["aps"]["alert"]["body"].stringValue != ""{
                    
                    body = json["aps"]["alert"]["body"].stringValue
                    
                }else{
                    
                    body = json["aps"]["alert"].stringValue
                    
                }
                
                print("la info del push 3 \(json)")
                let defaults = UserDefaults.standard
                defaults.set("algo", forKey: "push")
                
            }
            
        }


}

