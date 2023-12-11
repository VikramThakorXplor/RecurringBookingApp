//
//  BookingDetailsVC.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 08/12/23.
//

import SwiftUI

 
struct BookingDetailsVC: View {
    let bookingDetails : BookingDetailsModel
    //Declared Global Class object to access it anywhere
    @EnvironmentObject var objGlobal : GlobalClass
 
    @State private var  firstOption: DropDownMenuOption? = nil
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    @State var isSelected: Bool = false
    @State var selected = 0
    @State var isExpanded = false
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var strChildName = ""
    @State private var strSelectedTime = ""
    
    public var arrSelectedDays = [String]()
 
     var arrTemp = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]

    var body: some View {
        NavigationView {
            GeometryReader{ proxy in
                ZStack{
                    Color.black
                }.frame(width: proxy.size.width,height: 5,alignment: .leading)
                VStack(alignment: .leading, spacing: 20.0){
                    ScrollView() {
                        VStack(alignment: .center) {
                            Text("Summary").font(.system(size: 16,weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .topLeading).padding(EdgeInsets(top: 25, leading: 15 , bottom: 0, trailing: 0)).multilineTextAlignment(.center).font(.title)
                        }.background(Color(Color.clear))
                        Spacer(minLength: 20)
                        
                        HStack(){
                            Label(
                                title: { Text("Jimmy").padding([.leading],-15) },
                                icon: { Image(systemName: "person").padding() }
                            ).frame(width: 120, height: 50, alignment: .leading).frame(height: 50)
                            Spacer(minLength: 20)
                        }.border(Color.gray, width: objGlobal.borderLineWidth).padding([.leading, .trailing],15)
                        Spacer(minLength: 20)
                        HStack(){
                            Text("Before School care 5pm - 3am").multilineTextAlignment(.leading).padding([.leading],15).font(.system(size: 15,weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer(minLength: 10)
                        HStack{
                            Text("Before School care 5pm - 3amBefore School care 5pm - 3amBefore School care 5pm - 3am Before School care 5pm - 3amBefore School care 5pm - 3amBefore School care 5pm").multilineTextAlignment(.leading).padding([.leading],15).font(.system(size: 15,weight: .regular))
                            Spacer(minLength: proxy.size.width/2)
                        }
                        Spacer(minLength: 20)
                        VStack(alignment: .leading){
                            HStack{
                                Text("    You are ").font(AppConstants.fontRegular14) + Text(String(self.getNumberOfDays())).font(AppConstants.fontBold14) + Text(" days").font(AppConstants.fontRegular14)
                                  Spacer(minLength: 5)
                            }
                            Spacer(minLength: 10)
                            HStack{
                                Text("Booking reference number:").multilineTextAlignment(.leading).padding([.leading],15).font(.system(size: 15,weight: .semibold))
                                // Start & End Date Label
                                Spacer(minLength: 5)
                            }
                            Spacer(minLength: 3)
                            HStack{
                                Text("7656565757hhgf677676").multilineTextAlignment(.leading).padding([.leading],15).font(.system(size: 15,weight: .regular))
                            }
                        }
                        
                        VStack() {
                            Spacer(minLength: (proxy.size.height/2) - 130)
                            Button(action: {
                                // Handle button tap here
                            }) {
                                Text("Change booking").frame(maxWidth: .infinity).frame(height: 50)
                            }.foregroundColor(AppConstants.blueEnableColor).background(.white).border(AppConstants.blueEnableColor,width: objGlobal.borderLineWidth)
                                .padding([.leading,.trailing],15)
                            Button(action: {
                                // Handle button tap here
                            }) {
                                Text("DONE").frame(maxWidth: .infinity).frame(height: 50)
                            }.foregroundColor(.white).background(AppConstants.blueEnableColor).border(.clear,width: objGlobal.borderLineWidth)
                                .padding([.leading,.trailing],15)
                        }
                    }.clipped()
                }//.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    
 
    func numberOfRecurringDays(startDate: Date, endDate: Date, forWeekdays weekdays: Set<Int>) -> Int {
        let calendar = Calendar.current
        var count = 0
        
        // Iterate through each day between start and end dates
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
       
        // Example usage:
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let startDateString = "2024-01-02"
        let endDateString = "2024-12-20"
        var recurringDays = 0
        if let startDate = dateFormatter.date(from: startDateString),
            let endDate = dateFormatter.date(from: endDateString) {
            recurringDays = numberOfRecurringDays(startDate: startDate, endDate: endDate, forWeekdays: [2, 3,4]) // 2 for Monday, 3 for Tuesday
            print("Number of recurring Mondays and Tuesdays: \(recurringDays)")
        }
        return recurringDays
    }
}

#Preview {
    ContentView()
}


 
 
extension String{
    
}
  
