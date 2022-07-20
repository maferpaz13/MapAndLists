//
//  UbicacionVehViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 22/06/22.
//

import Foundation

class UbicacionVehViewModel {
    
    
    func getUbicacion(parameters:ClientStruct,completion: @escaping (UbicacionVehModel.UbicacionVehData?) -> ()) {
        
        UbicacionVehAPIClient().getUbicacion(parameters: parameters) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(UbicacionVehModel.UbicacionVehData.self, from: Result.data!) as UbicacionVehModel.UbicacionVehData {
                    
                    completion(data)
                    
                }
                
            case .failure(_):
                
                completion(nil)
                
            }
        }
        
    }
    
}
