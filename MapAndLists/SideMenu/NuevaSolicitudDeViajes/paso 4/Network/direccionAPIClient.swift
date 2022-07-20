//
//  direccionAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import Foundation
import Alamofire

class direccionAPIClient {
    
    func getDireccion(route_id: Int, load: Bool, unload: Bool,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.DireccionesNegocio.replacingOccurrences(of: "{BigCostumerID}", with: UserDefaults.standard.string(forKey: "bigcustomer_id")!).replacingOccurrences(of: "{RouteID}", with: "\(route_id)").replacingOccurrences(of: "{load}", with: "\(load)").replacingOccurrences(of: "{unload}", with: "\(unload)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
    }
    
}
