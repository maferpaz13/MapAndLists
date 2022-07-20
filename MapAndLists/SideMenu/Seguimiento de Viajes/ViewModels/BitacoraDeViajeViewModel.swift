//
//  BitacoraDeViajeViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation

class BitacioraDeViajeViewModel {
    
    func getBitacora(request_id: Int, completion: @escaping (BitacioraDeViajeModel.BitacoraDeViajeData?) -> ()){
        
        BitacoraDeViajeAPIClient().getBitacora(request_id: request_id) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(BitacioraDeViajeModel.BitacoraDeViajeData.self, from: Result.data!) as BitacioraDeViajeModel.BitacoraDeViajeData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}
