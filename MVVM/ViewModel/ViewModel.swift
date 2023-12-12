//
//  ViewModel.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import SwiftUI

protocol ViewModelProtocol {
    func getChildrenData() -> [Children]
}

class ViewModel : ObservableObject{
    private let apiManager = APIManager()
    @State var  resData: [Children]?
 
    func loadChildrenFromServer(strParam:String, completion: @escaping([Children]) -> Void)  {
        apiManager.getChildren(strParam: strParam) { result in
            switch result {
            case .success(let modelData):
                  completion((modelData.data?.children ?? [Children]()))
                 break
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
 
    func loadRoomsForChildren(strParam:String, completion: @escaping([BookingRooms]) -> Void)  {
        apiManager.getRoomsChildren(strParam: strParam) { result in
            switch result {
            case .success(let modelData):
                completion(modelData.data?.bookingRooms ?? [BookingRooms]())
                 break
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
}

