//
//  emiteAPICliente.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 15/07/22.
//

import Foundation
import Alamofire

class emiteAPIClient {
    
    func getemite(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.Emite.replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            completion(Result)
        }
    }
    
}
