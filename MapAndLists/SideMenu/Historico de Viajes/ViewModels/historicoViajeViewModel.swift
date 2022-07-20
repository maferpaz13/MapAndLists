//
//  historicoViajeViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation
import Alamofire

class historicoViajeViewModel {
    
    func getHistorico(completion: @escaping (historicoViajeModel.historicoViajeData?)->()){
        
        historicoViajeAPIClient().getHistorico { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(historicoViajeModel.historicoViajeData.self, from: Result.data!) as historicoViajeModel.historicoViajeData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}

