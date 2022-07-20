//
//  NegocioAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation
import Alamofire

class NegocioAPIClient {
    
    func getNegocio(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.negociosBigCostumer.replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            completion(Result)
        }
    }
    
}
