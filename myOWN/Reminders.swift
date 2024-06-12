
//
//  Reminders.swift
//  myOWN
//
//  Created by Adeeb Shaik on 6/8/24.
//

import Foundation
import SwiftUI

struct Reminder_: View {
//    @State private var remds: [Rem] = [Rem(title: "Buy Groceries", desc: "Buy fruits and vegetables", dat: Date(), pri: "high")]
//    @State var remds: [Rem] = []
    @EnvironmentObject var mylist: ListOfReminders
    @State private var isAn = false
    @State private var showingReminderForm = false
    
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                        Text("Your Reminders")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.blue)
                            .padding()
                    if mylist.remds.isEmpty {
                            Spacer()
                        }
                    Spacer()
                    Button(action: {
                        print("Clicked")
                        showingReminderForm.toggle()
                    }) {
                        Image(systemName: "plus.app")
                    }
                    .padding()
                    .sheet(isPresented: $showingReminderForm) {
                        ReminderFormView__(isPresented: $showingReminderForm) { newReminder in
                            mylist.remds.append(newReminder)
                            mylist.remds.sort(by: { $0.dat < $1.dat }) // Sort after appending
                          
                        }
                    }
                }
                
            }
            
            if mylist.remds.filter{!$0.completed}.isEmpty {
                Image(systemName: "checkmark.gobackward")
                    .resizable()
                    .padding()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(isAn ? 360 : 0))
                    .animation(.easeInOut(duration: 1), value: isAn)
                    .onTapGesture {
                        self.isAn.toggle()
                    }
                Text("You are up to date!")
                Divider()
                    .padding(.horizontal)
                List{}
            }
            
            else {
                List {
                    ForEach(mylist.remds.indices.filter { !mylist.remds[$0].completed }, id: \.self) { index in
                        HStack {
                            if mylist.remds[index].pri.lowercased() == "high" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.red)
                            } else if mylist.remds[index].pri.lowercased() == "med" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.yellow)
                            } else {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading) {
                                Text(mylist.remds[index].title)
                                    .font(.headline)
                                Text(mylist.remds[index].desc)
                                    .font(.subheadline)
                                Text(mylist.remds[index].dat, style: .date)
                                    .font(.caption)
                                Text(mylist.remds[index].pri.capitalized)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .swipeActions(edge: .trailing) { // Add swipe actions
                            Button(action: {
                                withAnimation(.spring(duration: 2)) {
                                    mylist.remds[index].completed.toggle()
                                }
                            }) {
                                Label("Complete", systemImage: "checkmark.circle.fill")
                            }
                            .tint(.green) // Button color
                        }
                    }
                }
            }
        }
    }
}

struct Rem: Identifiable {
    var id = UUID()
    var title: String = ""
    var desc: String = ""
    var dat: Date = Date(timeIntervalSinceReferenceDate: 0)
    var completed = false
    var pri = ""
}

class ListOfReminders: ObservableObject {
    @Published var remds: [Rem] = []
    
}

#Preview {
    Reminder_().environmentObject(ListOfReminders())
}
