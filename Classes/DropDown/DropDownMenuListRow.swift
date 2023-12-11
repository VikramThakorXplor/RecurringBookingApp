//
//  DropDownMenuListRow.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI

struct DropDownMenuListRow: View {
    let option: DropDownMenuOption
    let onSelectionAction:(_ option: DropDownMenuOption) -> Void

    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text(option.option).frame(maxWidth: .infinity,alignment: .leading).background(Color.red)
        }.foregroundColor(.black)
            .padding(.vertical,5)
            .padding(.horizontal).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
     }
}

struct DropDownMenuListRow_Previews: PreviewProvider {
    static var previews: some View{
        DropDownMenuListRow(option: DropDownMenuOption.single, onSelectionAction: {_ in })
    }
}
