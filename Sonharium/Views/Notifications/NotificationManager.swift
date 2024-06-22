//
//  NotificationManager.swift
//  Sonharium
//
//  Created by Gilberto Neto on 20/06/24.
//

import Foundation
import UserNotifications

struct NotificationManager {
    static func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                print("Autorização de notificação concedida.")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    static func scheduleNotification(notificationTimeString: String) {
        guard let date = DateHelper.dateFormatter.date(from: notificationTimeString) else {
            return
        }
        let content = UNMutableNotificationContent()
        content.title = "Você sonhou hoje?"
        content.body = "Lembre-se de registrá-lo aqui na floresta dos sonhos"
        content.sound = .default
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "SonhariumReminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    static func cancelNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["SonhariumReminder"])
    }
}
