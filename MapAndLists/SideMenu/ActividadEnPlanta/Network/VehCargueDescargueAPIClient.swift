//
//  VehCargueDescargueAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation
import Alamofire

class VehCargueDescargueAPIClient {
    
    func getCarDescar(id: Int,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.vehCargueDescargue.replacingOccurrences(of: "{PlantID}", with: "\(id)").replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            print(Result.debugDescription)
            completion(Result)
            
        }
    }
}
