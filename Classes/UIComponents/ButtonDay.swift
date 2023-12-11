//
//  ButtonDay.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 08/12/23.
//

import SwiftUI

struct ButtonDay: View {
    @State private var didTap = false
     var name: String = ""
    
    @EnvironmentObject var objGlobal: GlobalClass
     init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Button(action: {
            if !objGlobal.arrSelectedDays.contains(self.name) {
                objGlobal.arrSelectedDays.append(self.name)
            }else{
                 if let index = objGlobal.arrSelectedDays.firstIndex(of: self.name){
                    objGlobal.arrSelectedDays.remove(at: index)
                }
             }
            self.didTap.toggle()
        }, label: { Text(self.name).padding([.leading,.trailing],14).frame(height:40) })        .buttonStyle(LeftBorderButtonStyle())
            .colorMultiply(.black)
            .background(self.didTap ? Color.orange : Color.white)
            
     }
}

#Preview {
    ButtonDay(name: "")
}


struct LeftBorderButtonStyle: ButtonStyle {
    @EnvironmentObject var objGlobal: GlobalClass

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(0)
            .contentShape(Rectangle())
            .overlay(
                GeometryReader { geometry in
                    Rectangle()
                        .frame(width: objGlobal.borderLineWidth, height: geometry.size.height)
                        .offset(x: 0, y: 0)
                },
                alignment: .leading
            )
    }
}
