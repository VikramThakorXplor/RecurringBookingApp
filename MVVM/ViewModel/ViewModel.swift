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

    func loadChildrenFromServer(completion: @escaping(Result<[Children],ServiceError>) -> Void)  {
          apiManager.getChildren { result in
            switch result {
            case .success(let modelData):
                 completion(.success(modelData.data?.children ?? [Children]()))
                 break
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
}

