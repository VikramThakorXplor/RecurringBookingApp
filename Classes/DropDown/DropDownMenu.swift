//
//  DropDownMenu.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI
import ActivityIndicatorView

struct DropDownMenu: View {
    @EnvironmentObject var objGlobal : GlobalClass
    @State private var isOptionVisible: Bool = false
    @State var tag: Int = 0
    @State var isSelected: Bool = false
    @State var isSelectedIndex: Int = 0
    @ObservedObject var objViewModel = ViewModel()
    @Binding public var selectedOption: DropDownMenuOption?
    @State  var placeholderValue:String
    @State private var showLoadingIndicator: Bool = true
    @State private var allowUserInteraction = true
    
    let placeholder:String
    let options: [DropDownMenuOption]
    let arrChildren: [Children]
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionVisible.toggle()
            }
        }){
            HStack(){
                Text(selectedOption == nil ? placeholder : self.tag == 1 ? "Who" : "Where")
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
                        Spacer(minLength: self.tag == 1 ? 64 : 50)
                        GeometryReader { proxy in
                            ScrollView{
                                List {
                                    Section(header: Text(self.tag == 1 ? "Who's going?" : "Choose a room")
                                        .padding([.leading],-19)
                                        .padding([.top], -11)
                                        .font(AppConstants.fontBold16)
                                        .foregroundColor(.black)) {
                                      
                                        ForEach(self.objGlobal.arrChildren ?? [Children](), id: \.self) { item in
                                            Button(action: {
                                                withAnimation {
                                                     self.placeholderValue = item.fullName ?? ""
                                                    objGlobal.strSelectedChildID =  item.id

                                                    if self.tag == 1{
                                                        objGlobal.strSelectedChild = self.placeholderValue
                                                    }else{
                                                        objGlobal.strSelectedTime = self.placeholderValue
                                                    }
                                                    objViewModel.loadRoomsForChildren(strParam: item.availableRoomsId ?? "0") { resData in
                                                       objGlobal.arrRooms = resData
                                                     }
                                                    self.isOptionVisible.toggle()
                                                }
                                            })
                                            {
                                                HStack{
                                                    Image(systemName:  self.placeholderValue == item.fullName ? "largecircle.fill.circle" : "circle").tint(Color.black)
                                                        .onTapGesture {
                                                            self.placeholderValue = item.fullName ?? ""
                                                            self.isOptionVisible.toggle()
                                                        }
                                                    Text(item.fullName ?? "").frame(maxWidth: .infinity,alignment: .leading).background(Color.clear).colorMultiply(.black)
                                                }
                                            }.padding([.leading], -20)
                                        }
                                    }
                                }
                                .listRowSeparator(.hidden)
                                .listStyle(PlainListStyle())
                                .padding([.leading, .trailing], 15).background(Color.white).overlay  { RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.black, lineWidth: objGlobal.borderLineWidth)}
                                .frame(height: (CGFloat(self.objGlobal.arrChildren?.count ?? 0) * 40) + 70)
                                .background(Color.white)
                            }
                            .padding([.top], self.tag == 1 ? -68 : -55)
                            .padding(.vertical, 5).frame(height: (CGFloat(options.count) * 40) + 40)
                            .onAppear(
                                
                            )
                        }
                    }
                }
            }.onAppear{
            }
            .padding(.horizontal)
            .padding(.bottom, self.isOptionVisible ?  CGFloat(self.options.count * 40) > 300 ? CGFloat(self.options.count * 40)  :   CGFloat(self.options.count * 40) : 0)
    }
}

struct DropDownMenu_Previews : PreviewProvider{
    static var previews: some View {
        DropDownMenu(
            selectedOption: .constant(nil), placeholderValue: "", placeholder: "", options: DropDownMenuOption.arrChildren, arrChildren: [Children]()
        )
    }
}



extension DropDownMenu : ViewModelProtocol{
    func getChildrenData() -> [Children] {
        
        return [Children]()
    }
}

