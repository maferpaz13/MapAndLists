//
//  ActPlantaAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation
import Alamofire

class ActEnPlantaAPIClient {
    
    func getActividad(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.listaDePlantas.replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            completion(Result)
            
            
        }
        
    }
    
}


