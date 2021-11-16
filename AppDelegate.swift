//
//  AppDelegate.swift
//  GB_Maps
//
//  Created by iMac on 09.11.2021.
//  Copyright © 2021 AVIlyushin. All rights reserved.
//

import UIKit
import GoogleMaps
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
              center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                  guard granted else {
                      print("Разрешение не получено")
                      return
                  }
                  
                  self.sendNotificationRequest(
                      content: self.makeNotificationContent(),
                      trigger: self.makeIntervalNotificationTrigger()
                  )
              }
        
        GMSServices.provideAPIKey("AIzaSyDGrwVvbZwEjLxn5VjL9ov-UTLEw3q0vNs")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


    func makeNotificationContent() -> UNNotificationContent {
           let content = UNMutableNotificationContent()
           content.title = "Пожалуйста"
           content.subtitle = "Запустите меня"
           content.body = "Прошло 30 минут"
           content.badge = 4
           return content
       }
       
       func makeIntervalNotificationTrigger() -> UNNotificationTrigger {
           return UNTimeIntervalNotificationTrigger(
               timeInterval: 1800,
               repeats: false
           )
       }
       
       func sendNotificationRequest(
           content: UNNotificationContent,
           trigger: UNNotificationTrigger) {
           
           let request = UNNotificationRequest(
               identifier: "notification",
               content: content,
               trigger: trigger
           )
           
           let center = UNUserNotificationCenter.current()
           center.add(request) { error in
               if let error = error {
                   print(error.localizedDescription)
               }
           }
       }
        
}

extension UIViewController {
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
