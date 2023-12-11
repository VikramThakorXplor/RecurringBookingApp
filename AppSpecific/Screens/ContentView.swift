//
//  ContentView.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 08/12/23.
//

import SwiftUI

 
struct ContentView: View {
    //Declared Global Class object to access it anywhere
    @EnvironmentObject var objGlobal : GlobalClass
 
    @State private var  firstOption: DropDownMenuOption? = nil
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    @State var isSelected: Bool = false
    @State var selected = 0
    @State var isExpanded = false
    @State private var startDate = Date.now
    @State private var endDate = Date()
    
    @State private var strChildName = ""
    @State private var strSelectedTime = ""
    
    @StateObject var objViewModel = ViewModel()
    public var arrSelectedDays = [String]()
 
    var arrTemp = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]

    var body: some View {
 
        NavigationView {
            GeometryReader{ proxy in
                ZStack{
                    Color.black

                }.frame(width: proxy.size.width,height: 5,alignment: .leading)
                VStack(alignment: .trailing, spacing: 20.0){
                  
                     VStack(alignment: .center) {
                         Text("New recurring booking")
                              .frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 25, leading: 0 , bottom: 0, trailing: 0)).multilineTextAlignment(.center).font(AppConstants.fontBold18)
                    }.background(Color(Color.clear))
                    ScrollView() {
                        DropDownMenu(tag: 1,selectedOption: self.$firstOption, placeholderValue: "jimmy", placeholder: "Who's using",options: DropDownMenuOption.arrChildren, arrChildren: objGlobal.arrChildren ?? [Children]())
                        // Who is using
                        
                        DropDownMenu(tag: 2, selectedOption: self.$firstOption, placeholderValue: "", placeholder: "Choose a room",options: DropDownMenuOption.arrSchoolTime, arrChildren: objGlobal.arrChildren ?? [Children]())
                        
                        // Start & End Date Label
                        Spacer(minLength: 5)
                        HStack(){
                            Text("Start Date").frame(width: 100, alignment: .topLeading).font(AppConstants.fontBold14)
                            Spacer()
                            Text("End Date").font(AppConstants.fontBold14).padding([.trailing], (proxy.size.width/2)-75)
                        }.padding()
                        
                        Spacer(minLength: -10)
                        
                        //Bottom Start Date Values with Icon
                        VStack(){
                            HStack(){
                                ZStack(){
                                    Image(systemName: "calendar").padding([.leading], -80)
                                    DatePicker("", selection: $startDate, in: Date.now..., displayedComponents: .date)
                                        .padding()
                                        .accentColor(.black)
                                        .background(Color.orange.opacity(0)) .frame(height: 50)
                                }.overlay {
                                    RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.gray, lineWidth: objGlobal.borderLineWidth)
                                }
                                ZStack(){
                                    Image(systemName: "calendar").padding([.leading], -80)
                                    DatePicker("", selection: $endDate,in: startDate... , displayedComponents: .date)
                                        .padding()
                                        .background(Color.orange.opacity(0))
                                        .frame(height: 50)
                                }.overlay {
                                    RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.gray, lineWidth: objGlobal.borderLineWidth)
                                }
                            }.padding([.leading, .trailing], 15)
                        }
                        Spacer(minLength: -20)
                        HStack(){
                            Text("Choose days").padding([.leading],15).font(.system(size: 16,weight: .bold)).padding([.top],25).padding([.bottom], 5)
                            Spacer()
                        }
                        
                        HStack( spacing: 0.0 ){
                            ForEach (0..<arrTemp.count) { index in
                                ButtonDay(name: arrTemp[index])
                            }
                        }.frame(maxWidth: .infinity).background(Color.clear).overlay {
                            RoundedRectangle(cornerRadius: objGlobal.borderRadius)
                                .stroke(.gray, lineWidth: objGlobal.borderLineWidth)
                                .frame(height:40)
                                .padding([.leading,.trailing],18)
                        }
                    }.clipped()

                    HStack {
                        NavigationLink(destination: BookingDetailsVC(bookingDetails: BookingDetailsModel(childName: "Vikram", selectedTime: "", startDate: "", endDate: "", selectedDays: "", childID: "", roomID: ""))){
                             Text("Review Booking").cornerRadius(objGlobal.borderRadius).frame(maxWidth: .infinity).frame(maxHeight: .infinity).foregroundColor(.white)
                        }
                    }.disabled(!validateAllRequiredFields).frame(height: 50).background(validateAllRequiredFields ? AppConstants.blueEnableColor :  AppConstants.grayDisableColor).padding([.leading, .trailing], 15).padding([.top],20)
                    
                    ZStack{
                        Color.black
                    }.frame(width: proxy.size.width,height: 0,alignment: .leading)
                }.onAppear{
                    objViewModel.loadChildrenFromServer(strParam: "076c0cb9-c60e-48eb-a447-77e85b700d94") { resData in
                        switch resData {
                        case .success(let res):
                            print(res)
                            objGlobal.arrChildren = res
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }

            var validateAllRequiredFields: Bool {
                var isValidated = false
                if objGlobal.strSelectedChild.count == 0  || objGlobal.strSelectedTime.count == 0 {
                    isValidated = false
                } else {
                    isValidated = true
                }
                return isValidated
            }

        }
    }
}

#Preview {
    ContentView()
}


 
 
extension String{
    
}
  
