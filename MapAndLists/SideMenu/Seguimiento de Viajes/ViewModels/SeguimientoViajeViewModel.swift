//
//  SeguimientoViajeViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import Foundation

class SeguimientoViajeViewModel {
    
    func getSeguimiento(completion: @escaping (SeguimientoViajeModel.SeguimientoViajedata?)->()){
        
        SeguimientoViajeAPIClient().getSeguimiento { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(SeguimientoViajeModel.SeguimientoViajedata.self, from: Result.data!) as SeguimientoViajeModel.SeguimientoViajedata {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
}
