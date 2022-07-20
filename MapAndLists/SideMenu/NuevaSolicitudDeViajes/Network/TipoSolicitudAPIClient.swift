//
//  historicoViajeAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation
import Alamofire

class TipoSolicitudAPIClient {
    
    func getTipoSolicitud(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.BookingsType, method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
    }
    
}
