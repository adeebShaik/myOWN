//
//  Reminders.swift
//  myOWN
//
//  Created by Adeeb Shaik on 6/7/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack(alignment: .topLeading){
//            Text("hi")
        }
        TabView {
//            Text("Reminders Screen") 
            Reminder_()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("All Reminders")
            }
            TodayView()
                .tabItem {
                    Image(systemName: "exclamationmark.transmission")
                    Text("Today")
            }

            LoginView()
                .tabItem {
                    Image(systemName: "person.crop.circle.badge")
                    Text("Your Account")
            }
        }
    }
}

#Preview {
    TabBarView().environmentObject(ListOfReminders())
}

