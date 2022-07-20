//
//  File.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 18/07/22.
//

import Foundation

class productosViewModel {
    
    func getproductos(request_id: Int,completion: @escaping (productosModel.productosData?)->()){
        
        productosAPIClient().getproducto(request_id: request_id) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(productosModel.productosData.self, from: Result.data!) as productosModel.productosData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}
