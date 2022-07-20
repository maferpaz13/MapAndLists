//
//  requestBookingsAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 11/07/22.
//

import Foundation
import Alamofire

class requestBookingsAPIClient {
    
    func getRequest(id: Int, completion: @escaping(AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.requestBooking.replacingOccurrences(of: "{BookingID}", with: "\(id)"), method: .get, headers: ["Authorization": "Bearer \(ObtenerToken())"]).responseData {
            
            (Result) in
            
            completion(Result)
            
        }
        
    }
}
