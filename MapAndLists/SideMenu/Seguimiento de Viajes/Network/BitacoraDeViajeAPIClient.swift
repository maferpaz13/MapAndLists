//
//  BitacoraDeViajeAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation
import Alamofire

class BitacoraDeViajeAPIClient {
    
    func getBitacora(request_id: Int, completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.BitacoraDeViaje.replacingOccurrences(of: "{RequestID}", with: "\(request_id)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            completion(Result)
        }
        
    }
    
}
