//
//  DetalleServViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import Foundation

class DetalleServViewModel {
    
    func getDetalle(request_id: Int ,completion: @escaping (DetalleServModel.DetalleServData?) ->()) {
        
        DetalleServAPIClient().getDetalle(request_id: request_id){ (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(DetalleServModel.DetalleServData.self, from: Result.data!) as DetalleServModel.DetalleServData {
                    
                    print("Si obtuve la info")
                    completion(data)
                    
                }else{
                    
                    print("No pude decodificar la info")
                    completion(nil)
                    
                }
                
                
            case .failure(_):
                
                print("Fue fallido")
                completion(nil)
                
            }
        }
        
    }
    
}
