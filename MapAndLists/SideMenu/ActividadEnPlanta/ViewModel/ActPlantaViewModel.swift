//
//  ActPlantaViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation

class ActPlantaViewModel {
    
    func getActividad(completion: @escaping (ActPlantaModel.ActPlantaData?) -> ()){
        
        ActEnPlantaAPIClient().getActividad { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(ActPlantaModel.ActPlantaData.self, from: Result.data!) as ActPlantaModel.ActPlantaData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
        
    }
    
}
