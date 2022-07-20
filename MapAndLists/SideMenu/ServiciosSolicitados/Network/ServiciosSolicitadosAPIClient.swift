//
//  ServiciosSolicitadosAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 28/06/22.
//

import Foundation
import Alamofire

class ServiciosSolicitadosAPIClient {
    
    func getServicios(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.serviciosSolicitados.replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
        
    }
    
}
