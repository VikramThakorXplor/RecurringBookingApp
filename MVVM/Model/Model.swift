//
//  Model.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import Foundation
 
class Model: ObservableObject {
     private let apiService = APIManager()
}
 
 enum ServiceError : Error{
    case failed
    case invalidData
}

class APIManager {
 
    
    func getChildren(completion: @escaping (Result<ModelData,ServiceError>) -> Void) {

        var request =  URLRequest(url: URL(string: "https://api.myjson.online/v1/records/076c0cb9-c60e-48eb-a447-77e85b700d94")!)
        request.httpMethod = "GET"
        request.addValue("66e627a5-cfff-4a8e-b80f-6f0e572bf476", forHTTPHeaderField: "x-collection-access-token")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            if let responseData = response as? HTTPURLResponse {
                if responseData.statusCode == 200, let data = data{
                    do {
                        let modeldata = try JSONDecoder().decode(ModelData.self, from: data)
                        completion(.success(modeldata))
                     } catch {
                        print("Error\(error.localizedDescription)")
                    }
                }
            }
            
        }.resume()
        
        
    }
}
 
