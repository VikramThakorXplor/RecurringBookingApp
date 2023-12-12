//
//  RoomDropDownMenu.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI
import ActivityIndicatorView

struct RoomDropDownMenu: View {
    @EnvironmentObject var objGlobal : GlobalClass
    @State private var isOptionVisible: Bool = false
    @State var tag: Int = 0
    @State var isSelected: Bool = false
    @State var isSelectedIndex: Int = 0
    @ObservedObject var objViewModel = ViewModel()
    @State  var placeholderValue:String
    @State  var placeholder:String

    let options: [DropDownMenuOption]

    var body: some View {
        Button(action: {
            withAnimation {
                if self.objGlobal.arrRooms?.count ?? 0 == 0 {
                    return
                }
                self.isOptionVisible.toggle()
            }
        }){
            HStack(){
                Text(  "Where")
                    .foregroundColor(.black).font(AppConstants.fontLight16)
                Spacer()
                Text(placeholderValue).font(.system(size: 14,weight: .bold))
                    .foregroundColor(.black).font(AppConstants.fontLight16)
            }.frame(height:  self.tag == 1 ? 30 : 20)
        }.padding()
            .overlay {
                RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.gray, lineWidth: objGlobal.borderLineWidth)
            }.overlay(alignment: .top){
                VStack{
                    if self.isOptionVisible {
                        Spacer(minLength: 50)
                        GeometryReader { proxy in
                            ScrollView{
                                List {
                                    Section(header: Text("Choose a room")
                                        .padding([.leading],-19)
                                        .padding([.top], -11)
                                        .font(AppConstants.fontBold16)
                                        .foregroundColor(.black)) {
                                        ForEach(self.objGlobal.arrRooms ?? [BookingRooms](), id: \.self) { item in
                                            
                                            let strFinalRoom = "\(item.roomName ?? "")\(" - ")\(self.objGlobal.convertDateAndTime(timeString: item.startTime ?? "") ?? "")\(" - ")\(self.objGlobal.convertDateAndTime(timeString: item.endTime ?? "") ?? "")"

                                            Button(action: {
                                                withAnimation {
                                                    self.placeholderValue = strFinalRoom
                                                    self.placeholder = item.roomName ?? ""
                                                    
                                                    if self.tag == 1{
                                                        objGlobal.strSelectedChild = self.placeholderValue
                                                    }else{
                                                        objGlobal.strSelectedTime = self.placeholderValue
                                                    }

                                                    self.isOptionVisible.toggle()
                                                    
                                                }
                                            })
                                            {
                                                HStack{
                                                    Image(systemName:  self.placeholder == item.roomName ? "largecircle.fill.circle" : "circle").tint(Color.black)
                                                        .onTapGesture {
                                                            self.placeholderValue = strFinalRoom
                                                            self.placeholder = item.roomName ?? ""
                                                            
                                                            self.isOptionVisible.toggle()
                                                        }
                                                    Text(strFinalRoom).frame(maxWidth: .infinity,alignment: .leading).background(Color.clear).colorMultiply(.black) .listRowSeparator(.hidden, edges: .top)
                                                }
                                            }.padding([.leading], -20)
                                        }
                                    }
                                }
                                 .listStyle(PlainListStyle())
                                .padding([.leading, .trailing], 15).background(Color.white).overlay  { RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.black, lineWidth: objGlobal.borderLineWidth)}
                                .frame(height: (CGFloat(self.objGlobal.arrRooms!.count ?? 0) * 40) + 60)
                                .background(Color.white)
                            }
                            .padding([.top],  -55)
                            .padding(.vertical, 5).frame(height: (CGFloat(7) * 40) + 40)
                            .onAppear(
                             )
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, self.isOptionVisible ? CGFloat(self.objGlobal.arrRooms!.count * 40) + 10 : 0)
    }
}

struct RoomDropDownMenu_Previews : PreviewProvider{
    static var previews: some View {
        RoomDropDownMenu(placeholderValue: "", placeholder: "", options: DropDownMenuOption.arrSchoolTime
        )
    }
}


 
