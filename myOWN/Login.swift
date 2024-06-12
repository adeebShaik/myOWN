//
//  Login.swift
//  myOWN
//
//  Created by Adeeb Shaik on 6/10/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLogged = false
    @StateObject private var userSession = UserSession()
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            Button(action: {
                if !username.isEmpty && !password.isEmpty {
                    userSession.username = username
                    userSession.isLogged = true
                }
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $userSession.isLogged) {
            Text("Welcome, \(username)!")
                .font(.title)
            ContentView()
                .environmentObject(userSession)
        }
    }
}


class UserSession: ObservableObject {
    @Published var username: String = ""
    @Published var isLogged: Bool = false
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
