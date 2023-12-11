//
//  DropDownMenuList.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI

struct DropDownMenuList: View {
    let options: [DropDownMenuOption]
    let onSelectionAction:(_ option: DropDownMenuOption) -> Void

    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading,spacing: 1) {
                ForEach(options) { option in
                    DropDownMenuListRow(option: option, onSelectionAction: self.onSelectionAction)
                }
             }
        }.padding(.vertical, 5).overlay  { RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 2)}.frame(height: CGFloat(options.count) * 40)
    }
}

struct DropDownMenuList_Previews: PreviewProvider{
    static var previews: some View{
        DropDownMenuList(options: DropDownMenuOption.arrChildren, onSelectionAction: { _ in})
    }
    
    
}
 
