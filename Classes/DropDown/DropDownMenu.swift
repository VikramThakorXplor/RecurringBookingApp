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

    @Binding public var selectedOption: DropDownMenuOption?

    let placeholder:String
    @State  var placeholderValue:String

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
                                    Section(header: Text("Who's going?").bold().padding([.leading, .top],15).padding([.bottom], 10)) {
                                        ForEach(options) { option in
                                            Button(action: {
                                                withAnimation {
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
                                                Text(option.option).frame(maxWidth: .infinity,alignment: .leading).background(Color.clear)
                                            }.foregroundColor(.black)
                                                .padding(.vertical,5)
                                                .padding(.horizontal).frame(width: proxy.size.width, height: 40)
                                        }
                                    }
                                }.background(Color.red).overlay  { RoundedRectangle(cornerRadius: objGlobal.borderRadius).stroke(.black, lineWidth: objGlobal.borderLineWidth)}
                            }.padding([.top], -70)
                                 .padding(.vertical, 5).frame(height: (CGFloat(options.count) * 40))
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
            selectedOption: .constant(nil), placeholder: "", placeholderValue: "", options: DropDownMenuOption.arrChildren
        )
    }
}
