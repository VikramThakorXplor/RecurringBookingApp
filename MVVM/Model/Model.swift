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
 
    
    func getChildren(strParam: String, completion: @escaping (Result<ModelData,ServiceError>) -> Void) {
        let strParam = String(format: "https://api.myjson.online/v1/records/%@", strParam)
        var request =  URLRequest(url: URL(string:strParam)!)
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
    
    func getRoomsChildren(strParam: String, completion: @escaping (Result<BookingRoomsData,ServiceError>) -> Void) {
        let strParam = String(format: "https://api.myjson.online/v1/records/%@", strParam)
        var request =  URLRequest(url: URL(string:strParam)!)
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
                        let modeldata = try JSONDecoder().decode(BookingRoomsData.self, from: data)
                        completion(.success(modeldata))
                     } catch {
                        print("Error\(error.localizedDescription)")
                    }
                }
            }
            
        }.resume()
     }
}
 
