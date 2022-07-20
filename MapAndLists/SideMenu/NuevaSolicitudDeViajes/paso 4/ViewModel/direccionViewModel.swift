//
//  direccionViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import Foundation

class direccionViewModel {
    
    func getdireccion(route_id: Int, load: Bool, unload: Bool,completion: @escaping (direccionModel.direccionDatas?)->()){
        
        direccionAPIClient().getDireccion(route_id: route_id, load: load, unload: unload) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(direccionModel.direccionDatas.self, from: Result.data!) as direccionModel.direccionDatas {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}
