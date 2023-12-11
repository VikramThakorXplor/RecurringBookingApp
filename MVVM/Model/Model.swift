//
//  Model.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import Foundation
 
class Model: ObservableObject {
//    @Published var responseData: ResponseData?
//        private let apiService = APIService()
}
class APIManager {
    
    
    func getChildren(completion: @escaping ([Children]?) -> Void) {
        // Perform API call here using URLSession or other networking libraries
        // For example, URLSession.shared.dataTask...
        // Assume `postsData` contains data retrieved from the API
        
        // Simulated response
        
        URLSession.shared.dataTask(with: URLRequest.init(url: URL(string: "https://api.myjson.online/v1/records/076c0cb9-c60e-48eb-a447-77e85b700d94")!)) {data, response, error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let responseData = response as? HTTPURLResponse {
                if responseData.statusCode == 200, let data = data{
                    do {
                        let decoder = JSONDecoder()
                        let arrChildren =  try decoder.decode([Children].self, from: data)
                        print(arrChildren)
                        completion(arrChildren)
                    } catch  {
                        print("Error decoding JSON: \(error.localizedDescription)")
                        completion(nil)
                    }
                }
            }
            
        }
        
        
    }
}
