//
//  CustomCellView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI
import UIKit

struct CustomCellView: View {
    var iconName: String
    var text: String
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.accentColor)
                    .frame(width: 30, height: 30)
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
            Text(text)
            Spacer()
        }
    }
}

struct DetailView: View {
    var text: String
    var body: some View {
        Text("Detalhes sobre \(text)")
            .navigationTitle(text)
    }
}

func setupNavigationBarAppearance() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.standard]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.standard]
}

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @AppStorage("isScheduled") var isScheduled = false
    @AppStorage("notificationTimeString") var notificationTimeString = ""

    init() {
        setupNavigationBarAppearance()
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Notificações").foregroundColor(.accentColor)) {
                    Toggle(isOn: $isScheduled) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.accentColor)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            Text("Lembrete Diário")
                        }
                    }
                    .tint(.accentColor)
                    .onChange(of: isScheduled) {
                        handleIsScheduledChange(isScheduled: isScheduled)
                    }
                    if isScheduled {
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
                Section(header: Text("Segurança").foregroundColor(.accentColor)) {
                    Toggle(isOn: $authManager.isFaceIDEnabled) {
                        CustomCellView(iconName: "lock.fill", text: "Bloqueio com Face ID")
                            .frame(height: 30)
                    }
                    .tint(.accentColor)
                }
                Section(header: Text("Desenvolvimento").foregroundColor(.accentColor)) {
                    NavigationLink(destination: ContentViewTwo()) {
                        CustomCellView(iconName: "info.circle.fill", text: "Sobre")
                            .frame(height: 30)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(.fundo)
            .navigationTitle("Configurações")
            .scrollDisabled(true)
        }
    }
}

private extension ContentView {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthenticationManager())
    }
}

//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button {
//                    dismiss()
//                } label: {
//                    Label("Voltar", systemImage: "chevron.left")
//                        .bold()
//                        .labelStyle(.iconOnly)
//                }
//                .buttonStyle(.borderless)
//            }
//        }
