//
//  ServiciosSolicitadosViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 28/06/22.
//

import Foundation

class ServiciosSolicitadosViewModel {
    
    func getServicios(completion: @escaping (ServiciosSolicitadosModel.ServiciosSolicitadosData?) -> ()){
        
        ServiciosSolicitadosAPIClient().getServicios { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(ServiciosSolicitadosModel.ServiciosSolicitadosData.self, from: Result.data!) as ServiciosSolicitadosModel.ServiciosSolicitadosData {
                    
                    completion(data)
                    
                }
                
            case .failure(_):
                
                completion(nil)
                
            }
        }
    }
    
}
