//
//  NotificationsView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 28/06/24.
//

import SwiftUI

struct NotificationsView: View {
    @AppStorage("isScheduled") var isScheduled = false
    @AppStorage("notificationTimeString") var notificationTimeString = ""
    var body: some View {
        DatePicker("Horário", selection: Binding(
            get: {
                // Get the notification time schedule set by user
                DateHelper.dateFormatter.date(from: notificationTimeString) ?? Date()
            },
            set: {
                // On value set, change the notification time
                notificationTimeString = DateHelper.dateFormatter.string(from: $0)
                handleNotificationTimeChange()
            }
        ), displayedComponents: .hourAndMinute)
        .datePickerStyle(WheelDatePickerStyle())
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
private extension NotificationsView {
    private func handleIsScheduledChange(isScheduled: Bool) {
        if isScheduled {
            NotificationManager.requestNotificationAuthorization()
            NotificationManager.scheduleNotification(notificationTimeString: notificationTimeString)
        } else {
            NotificationManager.cancelNotification()
        }
    }
    private func handleNotificationTimeChange() {
        NotificationManager.cancelNotification()
        NotificationManager.requestNotificationAuthorization()
        NotificationManager.scheduleNotification(notificationTimeString: notificationTimeString)
    }
}
#Preview {
    NotificationsView()
}
