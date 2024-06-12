//
//  ContentView.swift
//  myOWN
//
//  Created by Adeeb Shaik on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    var body: some View {
        VStack{
            Text("My App")
                .bold()
            
            TabBarView()
        }
    }
}

#Preview {
    ContentView().environmentObject(ListOfReminders()).environmentObject(UserSession())
}

