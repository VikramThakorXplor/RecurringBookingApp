//
//  DropDownMenu.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI

struct DropDownMenu: View {
    @EnvironmentObject var objGlobal : GlobalClass
    @State private var isOptionVisible: Bool = false
    @State var tag: Int = 0
    @State var isSelected: Bool = false
    @State var isSelectedIndex: Int = 0    
    @Binding public var selectedOption: DropDownMenuOption?
    @State  var placeholderValue:String

    let placeholder:String
    let options: [DropDownMenuOption]
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionVisible.toggle()
            }
        }){
            HStack(){
                Text(selectedOption == nil ? placeholder : self.tag == 1 ? "Who" : "Where")
                    .foregroundColor(selectedOption == nil ? .gray : .black).font(.system(size: 14,weight: .regular))
                Spacer()
                Text(placeholderValue).font(.system(size: 14,weight: .bold))
                    .foregroundColor(selectedOption == nil ? .gray : .black)
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
                                LazyVStack(alignment: .leading,spacing: 1) {
                                    Section(header: Text(self.tag == 1 ? "Who's going?" : "Choose a room").bold().padding([.leading, .top],15).padding([.bottom], 10)) {
                                        
                                        ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                                            Button(action: {
                                                withAnimation {
                                                    self.isSelectedIndex = index
                                                    selectedOption = option
                                                    self.placeholderValue = option.option
                                                    if self.tag == 1{
                                                        objGlobal.strSelectedChild =  self.placeholderValue
                                                    }else{
                                                        objGlobal.strSelectedTime =  self.placeholderValue
                                                    }
                                                    self.isOptionVisible.toggle()
                                                }
                                            }) {

                                                HStack {
                                                    Image(systemName:  self.isSelectedIndex == index ? "largecircle.fill.circle" : "circle")
                                                            .onTapGesture {
                                                                self.isSelected.toggle()
                                                                self.isSelectedIndex = index
                                                                self.isOptionVisible.toggle()
                                                             }
                                                        Text(option.option).frame(maxWidth: .infinity,alignment: .leading).background(Color.clear)
                                                 }
                                                
                                             }.foregroundColor(.black)
                                                .padding(.vertical,5)
                                                .padding(.horizontal).frame(width: proxy.size.width, height: 40)
                                        }
                                    }
                                }.padding([.leading, .trailing],-9).background(Color.white).overlay  { RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.black, lineWidth: objGlobal.borderLineWidth)}
                            }.padding([.top], self.tag == 1 ? -68 : -55)
                                 .padding(.vertical, 5).frame(height: (CGFloat(options.count) * 40) + 40)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, self.isOptionVisible ?  CGFloat(self.options.count * 40) > 300 ? CGFloat(self.options.count * 40)  :   CGFloat(self.options.count * 40) : 0)
     }
}

struct DropDownMenu_Previews : PreviewProvider{
    static var previews: some View {
        DropDownMenu(
            selectedOption: .constant(nil), placeholderValue: "", placeholder: "", options: DropDownMenuOption.arrChildren
        )
    }
}
