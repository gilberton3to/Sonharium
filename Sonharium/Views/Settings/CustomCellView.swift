//
//  CustomCellView.swift
//  Sonharium
//
//  Created by Gilberto Neto on 17/06/24.
//

import SwiftUI
import UIKit

struct CustomCellView: View {
    //
    var iconName: String
    var text: String
    //
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                //
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.standard)
                    .frame(width: 30, height: 30)
                //
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            } // fundo + ícone
            Text(text)   // texto Lembretes, Bloqueio, Sobre
                .font(.system(size: 17, design: .rounded))
            Spacer()
        }
    }
}
//
struct DetailView: View {
    //
    var text: String
    //
    var body: some View {
        Text("Detalhes sobre \(text)")
            .navigationTitle(text)
    }
}
// MUDAR COR DA NAVIGATIONBAR
func setupNavigationBarAppearance() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.standard]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.standard]
}
//
struct ContentView: View {
    //
    @EnvironmentObject var authManager: AuthenticationManager
    @AppStorage("isScheduled") var isScheduled = false
    @AppStorage("notificationTimeString") var notificationTimeString = ""
    init() {
        setupNavigationBarAppearance()
    }
    //
    var body: some View {
        ZStack {
        LinearGradient(stops: [
            .init(color: .fundo, location: 0.90),
            .init(color: .accentColor, location: 1.03)
        ], startPoint: .bottom, endPoint: .top)
        .ignoresSafeArea()
            List {
                Section(header: Text("Notificações").foregroundColor(.standard)) {
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
                        CustomCellView(iconName: "lock.fill", text: "Bloqueio do App")
                            .frame(height: 30)
                    }
                    .tint(.accentColor)
                }
                Section(header: Text("Desenvolvimento").foregroundColor(.standard)) {
                    NavigationLink(destination: ContentViewTwo()) {
                        CustomCellView(iconName: "info.circle.fill", text: "Sobre")
                            .frame(height: 30)
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(.fundo)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Configurações")
        .scrollDisabled(false)
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
#Preview {
    ContentView()
        .environmentObject(AuthenticationManager())
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
