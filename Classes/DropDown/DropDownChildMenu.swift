//
//  DropDownChildMenu.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 12/12/23.
//

import SwiftUI

struct DropDownChildMenu: View {
    @EnvironmentObject var objGlobal : GlobalClass
    @State private var isOptionVisible: Bool = false
    @State var tag: Int = 0
    @State var isSelected: Bool = false
    @State var isSelectedIndex: Int = 0
    @ObservedObject var objViewModel = ViewModel()
    @State  var placeholderValue:String
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionVisible.toggle()
            }
        }){
            HStack(){
                Text("Where")
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
                                    Section(header: Text("Choose a room").padding([.leading],-20).padding([.top],5).font(AppConstants.fontRegular14).colorMultiply(.black)) {
                                      
                                       
                                        
                                        /*
                                        
                                        
                                        
                                        ForEach(self.objGlobal.arrRooms ?? [BookingRooms](), id: \.self) { item in
                                            
                                            Button(action: {
                                                withAnimation {
                                                    self.isOptionVisible.toggle()
                                                }
                                            })
                                            {
                                                HStack{
                                                    Image(systemName:  self.placeholderValue == item.fullName ? "largecircle.fill.circle" : "circle").tint(Color.black)
                                                        .onTapGesture {
                                                            self.isOptionVisible.toggle()
                                                        }
                                                    Text("Vikram").frame(maxWidth: .infinity,alignment: .leading).background(Color.clear).colorMultiply(.black)
                                                }
                                            }.padding([.leading], -20)
                                        }.listRowBackground(Color.clear)

                                        
                                        
                                         */

                                        
                                        
                                        
                                    }
                                }
                                .padding([.leading, .trailing],-9).background(Color.white).overlay  { RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.black, lineWidth: objGlobal.borderLineWidth)}
                                .frame(height: (CGFloat(self.objGlobal.arrRooms?.count ?? 0) * 40) + 70)
                                .background(Color.white)
                            }
                            .padding([.top], -55)
                            .padding(.vertical, 5).frame(height: (CGFloat(self.objGlobal.arrRooms?.count ?? 0) * 40) + 40)
                            .onAppear(
                                
                            )
                        }
                    }
                }
            }.padding(.horizontal)
            .padding(.bottom, self.isOptionVisible ?  CGFloat((objGlobal.arrRooms?.count ?? 0) * 40) > 300 ? CGFloat(objGlobal.arrRooms?.count ?? 0 * 40)  :   CGFloat(objGlobal.arrRooms?.count  ?? 0 * 40) : 0)
    }
}
 
