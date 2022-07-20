//
//  SolicitudesAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 10/07/22.
//

import Foundation
import Alamofire

class SolicitudesAPIClient {
    
    func getSolicitud(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.bookingsBigCostumer.replacingOccurrences(of: "{BigCostumerID}", with: "8" /*UserDefaults.standard.string(forKey: "bigcustomer_id")!*/), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            
            (Result) in
            print(Result.debugDescription)
            completion(Result)
            
        }
        
    }
    
}
