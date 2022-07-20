//
//  UbicacionVehAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 22/06/22.
//

import Foundation
import Alamofire

class UbicacionVehAPIClient {
    
    func getUbicacion(parameters: ClientStruct,completion: @escaping (AFDataResponse<Data>) -> ()) {
    
        AF.request(EndPoints.domain+URLGet.ubicacionDelVehiculo, method: .get,parameters: parameters.dict, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            
            (Result) in
            completion(Result)
        }
        
    }
}
