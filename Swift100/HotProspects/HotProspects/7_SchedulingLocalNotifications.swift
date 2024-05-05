//
//  SchedulingLocalNotifications.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/3.
//

import SwiftUI
import UserNotifications
struct SchedulingLocalNotifications: View {
    var body: some View {
        Button("Request Permission") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
                if success {
                    print("All set!")
                }else if let error{
                    print(error.localizedDescription)
                }
            }
        }
        Button("Schedule Notification") {
            let content = UNMutableNotificationContent()
            content.title = "Feed the cat"
            content.subtitle = "It looks hungry"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let requset = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(requset)
        }
    }
}

#Preview {
    SchedulingLocalNotifications()
}
