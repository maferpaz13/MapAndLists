//
//  requestBookingViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation

class requestBookingViewModel {
    
    func getRequest(id: Int, completion: @escaping (requestBokingsModel.requestBokingsData?) -> ()) {
        
        requestBookingsAPIClient().getRequest(id: id) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(requestBokingsModel.requestBokingsData.self, from: Result.data!) as requestBokingsModel.requestBokingsData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    
    }
}
