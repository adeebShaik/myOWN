//
//  rForm.swift
//  myOWN
//
//  Created by Adeeb Shaik on 6/8/24.
//

import Foundation
import SwiftUI

struct ReminderFormView__: View{
    
    @State  var remTitle: String = ""
    @State private var remDes: String = ""
    @State private var selectedDate:Date = Date()
    @State private var showWarning = false
    @State private var priority = 0
    enum Options: String, CaseIterable, Identifiable{
        case low, med, high
        var id: Self {self}
    }
    @State private var selectedPri: Options = .low
    @Binding var isPresented: Bool
    let date = Date()
    let calendar = Calendar.current
    lazy var hour: Int = {
        return calendar.component(.hour, from: date)
    }()
    var isSetButtonDisabled: Bool {
        return remTitle.isEmpty || selectedDate < Calendar.current.startOfDay(for: Date())
    }
    var onAdd: (Rem) -> Void
    var body: some View{
        VStack {
            HStack {
                Spacer()
                Button("Close", systemImage: "xmark.circle.fill"){
                    isPresented.toggle()
                }
                .padding()
            .labelStyle(.iconOnly)
            }
        }
        Text("Add Reminder")
            .bold()
            .font(.title)
            .padding(.horizontal)
        TextField("Enter Title", text: $remTitle)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(Color.gray)
            .bold()
        TextField("Enter Description", text: $remDes)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(Color.gray)
            .bold()
        DatePicker("Pick a date", selection: $selectedDate, displayedComponents: .date)
            .padding(.horizontal)
            .bold()
        HStack{
            Text("Priority")
                .padding()
            Picker("Select Prioity", selection: $selectedPri){
                ForEach(Options.allCases){
                    option in Text(option.rawValue.capitalized)
                }
                
            }
            .pickerStyle(.segmented)
            .padding()
        }
//        Text("\(selectedPri.rawValue)")
        
        
        Spacer()
        Button("Set"){
            if isSetButtonDisabled{
                showWarning.toggle()
            }
            else{
                let newReminder = Rem (
                    title: remTitle,
                    desc: remDes,
                    dat: selectedDate,
                    pri: selectedPri.rawValue
                )
                onAdd(newReminder)
                isPresented.toggle()
                print("raw value \(newReminder.pri)")
                print("Data is dataed")
            }
        }
        .alert(isPresented: $showWarning){
            Alert(title: Text("Error"), message: Text("Please enter title and a valid date"), dismissButton: .default(Text("OK")))
        }
        .buttonStyle(.borderedProminent)
        .bold()
        .font(.largeTitle)
//        .disabled(isSetButtonDisabled)

        VStack{}
        Spacer()
        Spacer()
        Spacer()
    }
}


//#Preview {
//    ReminderFormView__(isPresented: true, onAdd: <#T##(Rem) -> Void#>)
//}
