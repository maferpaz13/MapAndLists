//
//  historicoViajeAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation
import Alamofire

class RutaAPIClient {
    
    func getRuta(id: Int, completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.rutaBusiness.replacingOccurrences(of: "{BusinessID}", with: "\(id)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
    }
    
}
