//
//  productosAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 18/07/22.
//

import Foundation
import Alamofire

class productosAPIClient {
    
    func getproducto(request_id: Int,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.BusinessProducts.replacingOccurrences(of: "{BusinessID}", with: "\(request_id)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            (Result) in
            completion(Result)
        }
    }
    
}
