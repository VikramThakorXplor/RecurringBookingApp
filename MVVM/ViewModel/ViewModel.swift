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

    func loadChildrenFromServer(strParam:String, completion: @escaping(Result<[Children],ServiceError>) -> Void)  {
        apiManager.getChildren(strParam: strParam) { result in
            switch result {
            case .success(let modelData):
                 completion(.success(modelData.data?.children ?? [Children]()))
                 break
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
    
    func loadRoomsForChildren(strParam:String, completion: @escaping(Result<[BookingRooms],ServiceError>) -> Void)  {
        apiManager.getRoomsChildren(strParam: strParam) { result in
            switch result {
            case .success(let modelData):
                completion(.success(modelData.bookingRooms ?? [BookingRooms]()))
                 break
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
}

