//import Foundation
//import SwiftUI
//
//struct TodayView: View {
//    @EnvironmentObject var mylist: ListOfReminders
//    @State private var symbolColor = Color.black
////    @State private var remds: [Rem] = [Rem(title: "Buy Groceries", desc: "Buy fruits and vegetables", dat: Date(), pri: "high"), Rem(title: "Buy Groceries", desc: "Buy fruits and vegetables", dat: Date(), pri: "med"), Rem(title: "Buy Groceries", desc: "Buy fruits and vegetables", dat: Date(), pri: "low"), Rem(title: "Buy Groceries", desc: "Buy fruits and vegetables", dat: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, pri: "low")]
//    var highs: [Rem] {
//        return mylist.remds.filter { $0.pri.lowercased() == "high" && isToday(date: $0.dat) }
//    }
//    var meds: [Rem] {
//        return mylist.remds.filter { $0.pri.lowercased() == "med" && isToday(date: $0.dat) }
//    }
//    var lows: [Rem] {
//        return mylist.remds.filter { $0.pri.lowercased() == "low" && isToday(date: $0.dat) }
//    }
//    var body: some View {
//        VStack {
//            Text("Due Today ...")
//                .font(.title)
//                .padding(.top, 30)
//                .padding(.leading, 20)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .bold()
//            
//            if mylist.remds.filter{!$0.completed}.isEmpty {
//                Spacer()
//                Image(systemName: "party.popper.fill")
//                    .resizable()
//                    .padding()
//                    .aspectRatio(contentMode: .fit)
//                    .onTapGesture {
//                        // Generate random color
//                        let randomRed = Double.random(in: 0...1)
//                        let randomGreen = Double.random(in: 0...1)
//                        let randomBlue = Double.random(in: 0...1)
//                        symbolColor = Color(red: randomRed, green: randomGreen, blue: randomBlue)
//                    }
//                    .foregroundColor(symbolColor)
//                Text("Nothing due today !")
//                Divider()
//                    .padding(.horizontal)
//                Spacer()
//            }
//            else{
//                List {
//                    // Apply the view structure for highs
//                    Text("High Priority")
//                        .bold()
//                        .foregroundColor(.red)
//                    if highs.isEmpty{
//                        Text("No High Priority")
//                    }
//                    else{
//                        ForEach(highs.indices.filter { !highs[$0].completed }, id: \.self) { index in
//                            ReminderRow(reminder: highs[index])
//                        }
//                    }
//                    
//                }
//                .background(.red)
//                    // Apply the view structure for meds
//                List{
//                    Text("Medium Priority")
//                        .bold()
//                        .foregroundColor(.yellow)
//                    if meds.isEmpty {
//                        Text("No Medium Priority")
//                    }
//                    else{
//                        ForEach(meds.indices.filter { !meds[$0].completed }, id: \.self) { index in
//                            ReminderRow(reminder: meds[index])
//                        }
//                    }
//                }
//                    // Apply the view structure for lows
//                List{
//                    Text("Low Priority")
//                        .bold()
//                        .foregroundColor(.gray)
//                    if lows.isEmpty{
//                        Text("No low Priority")
//                    }
//                    else{
//                        ForEach(lows.indices.filter { !lows[$0].completed }, id: \.self) { index in
//                            ReminderRow(reminder: lows[index])
//                        }
//                    }
//                }
//            }
//            Spacer()
//        }
//    }
//}
//
//struct ReminderRow: View {
//    @State var reminder: Rem
//    
//    var body: some View {
//        HStack {
//            if reminder.pri.lowercased() == "high" {
//                Image(systemName: "circle.fill")
//                    .foregroundColor(.red)
//            } else if reminder.pri.lowercased() == "med" {
//                Image(systemName: "circle.fill")
//                    .foregroundColor(.yellow)
//            } else {
//                Image(systemName: "circle.fill")
//                    .foregroundColor(.white)
//            }
//            
//            VStack(alignment: .leading) {
//                Text(reminder.title)
//                    .font(.headline)
//                Text(reminder.desc)
//                    .font(.subheadline)
//                Text(reminder.dat, style: .date)
//                    .font(.caption)
//            }
//            Spacer()
//        }
//        .swipeActions(edge: .trailing) { // Add swipe actions
//            Button(action: {
//                withAnimation(.spring(duration: 2)) {
//                    reminder.completed.toggle()
//                }
//            }) {
//                Label("Complete", systemImage: "checkmark.circle.fill")
//            }
//            .tint(.green) // Button color
//        }
//    }
//}
//
//private func isToday(date: Date) -> Bool {
//    let calendar = Calendar.current
//    return calendar.isDateInToday(date)
//}
//
//#Preview {
//    TodayView().environmentObject(ListOfReminders())
//}
