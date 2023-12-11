//
//  RecurringBookingAppApp.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 08/12/23.
//

import SwiftUI

@main
struct RecurringBookingAppApp: App {
    @StateObject var objGlobal = GlobalClass()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(objGlobal)
        }
    }
}
