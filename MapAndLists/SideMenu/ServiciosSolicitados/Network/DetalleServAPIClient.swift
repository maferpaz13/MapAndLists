//
//  DetalledelServicioAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import Foundation
import Alamofire

class DetalleServAPIClient {
    
    func getDetalle(request_id: Int,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.detallesServicio.replacingOccurrences(of: "{RequestID}", with: "\(request_id)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
    }
}
