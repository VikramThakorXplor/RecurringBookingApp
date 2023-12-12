//
//  BookingDetailsVC.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 08/12/23.
//

import SwiftUI

 
struct BookingDetailsVC: View {
    @State var startDate = Date()
    @State var endDate = Date()
    @State var strSelectedChild : String
    @State var strSelectedTime : String
    @State var arrSelectedDays = [String]()
    @State var strFinalUUID = String()
    @State var showsAlert = false

    @Environment(\.presentationMode) var presentationMode

    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
             }
        }
    }
    
     var body: some View {
        NavigationView {
            GeometryReader{ proxy in
                ZStack{
                    Color.black
                }.frame(width: proxy.size.width,height: 2,alignment: .leading)
                VStack(alignment: .leading, spacing: 20.0){
                    ScrollView() {
                        VStack(alignment: .center) {
                            Text("Summary").font(AppConstants.fontBold16)
                                .frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top: 25, leading: 15 , bottom: 0, trailing: 0)).multilineTextAlignment(.center).font(.title)
                        }.background(Color(Color.clear))
                        Spacer(minLength: 20)
                        
                        HStack(){
                            Label(
                                title: { Text(strSelectedChild).padding([.leading],-15).font(AppConstants.fontRegular16) },
                                icon: { Image(systemName: "person").padding([.trailing],15) }
                            ).padding([.leading, .trailing], 10)
                                .frame(height: 50)
                          Spacer(minLength: 20)
                        }.border(Color.gray, width: 1).padding([.leading, .trailing],15)
                        Spacer(minLength: 20)
                        HStack(){
                            Text(strSelectedTime).multilineTextAlignment(.leading).padding([.leading],15).font(AppConstants.fontBold16).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer(minLength: 10)
                        HStack{
                            let strFromTo = "From \(self.convertToStringFromDate(date: startDate) ?? "") \("Every") \(arrSelectedDays.joined(separator: ",")) \("Ends") \(self.convertToStringFromDate(date: endDate) ?? "")"
                            
                            Text(strFromTo).multilineTextAlignment(.leading).padding([.leading],15).font(AppConstants.fontRegular16)
                            Spacer(minLength: proxy.size.width/2)
                        }
                        Spacer(minLength: 20)
                        VStack(alignment: .leading){
                            HStack{
                                Text("    You are ").font(AppConstants.fontRegular16) + Text(String(self.getNumberOfDays())).font(AppConstants.fontBold16) + Text(" days").font(AppConstants.fontRegular16)
                                  Spacer(minLength: 5)
                            }
                            Spacer(minLength: 10)
                            HStack{
                                Text("Booking reference number:").multilineTextAlignment(.leading).padding([.leading],15).font(AppConstants.fontBold16)
                                // Start & End Date Label
                                Spacer(minLength: 5)
                            }
                            Spacer(minLength: 3)
                            HStack{
                                Text(strFinalUUID).multilineTextAlignment(.leading).padding([.leading],15).font(AppConstants.fontLight14)
                            }
                        }
                    }.clipped().scrollDisabled(true)
                    
                    VStack() {
                        Spacer(minLength: (proxy.size.height/2) - 130)
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Change booking").frame(maxWidth: .infinity).frame(height: 50).font(AppConstants.fontBold18)
                        }.foregroundColor((Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))).background(.white).border((Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1))),width: 1)
                            .padding([.leading,.trailing],15)
                        Button(action: {
                            self.showsAlert.toggle()
                        }) {
                            Text("DONE").frame(maxWidth: .infinity).frame(height: 50).font(AppConstants.fontBold18)
                        }
                        .alert(isPresented: $showsAlert) { () -> Alert in
                            Alert(title: Text("Congratulations!!!"), message: Text("You booking has been confirmed to our system."), dismissButton: .default(Text("Okay")){
                                presentationMode.wrappedValue.dismiss()
                            })
                            }
                        .foregroundColor(.white).background((Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))).border(.clear,width: 1)
                            .padding([.leading,.trailing],15)
                    }.padding([.bottom],10)
                     
                }//.edgesIgnoringSafeArea(.bottom)
            }.onAppear{
                var uuid = UUID().uuidString
                strFinalUUID = strFinalUUID + uuid
            }
        }.navigationTitle("Booking Details").navigationBarBackButtonHidden().navigationBarItems(leading: btnBack)
    }
 
 
    func numberOfRecurringDays(startDate: Date, endDate: Date, forWeekdays weekdays: [Int]) -> Int {
        let calendar = Calendar.current
        var count = 0
 
        calendar.enumerateDates(startingAfter: startDate, matching: .init(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime) { (date, _, stop) in
            guard let date = date, date <= endDate else {
                stop = true
                return
            }
            let weekday = calendar.component(.weekday, from: date)
            if weekdays.contains(weekday) {
                count += 1
            }
        }
         return count
    }

    func getNumberOfDays() -> Int{
         var arrTempDays = [Int]()
        for obj in arrSelectedDays {
            arrTempDays.append(self.getDayNumber(dayName: obj))
        }
         let recurringDays = numberOfRecurringDays(startDate: startDate, endDate: endDate, forWeekdays: arrTempDays) // 2 for Monday, 3 for Tuesday
            print("Number of recurring Mondays and Tuesdays: \(recurringDays)")
         return recurringDays + 1
    }
    
    
    func getDayNumber(dayName: String) -> Int{
         var day = dayName
        if dayName == "Tue" {
            day = "Tues"
        }else if dayName == "Wed" {
            day = "Wednes"
        }else if dayName == "Thu" {
            day = "Thurs"
        }else if dayName == "Sat" {
            day = "Satur"
        }
        let dayName = day + "day"

         let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "EEEE" // "EEEE" represents the full day name

         if let date = dateFormatter.date(from: dayName) {
            let calendar = Calendar.current
            let dayNumber = calendar.component(.weekday, from: date)
            
            print("Day number for \(dayName) is \(dayNumber)")
            return dayNumber
        } else {
            print("Invalid day name")
        }
        return 0
    }

  func convertToStringFromDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z" // Date format matching your input date string
      dateFormatter.dateFormat = "dd MMM yyyy" // Define the output format
      return dateFormatter.string(from: date)
    }

}

#Preview {
    ContentView()
}
