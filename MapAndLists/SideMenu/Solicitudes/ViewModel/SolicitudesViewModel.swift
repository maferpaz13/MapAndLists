//
//  SolicitudesViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 10/07/22.
//

import Foundation

class SolicitudesViewModel {
    
    func getSolicitudes(completion: @escaping (SolicitudesModel.SolicitudesData?) -> ()){
        
        SolicitudesAPIClient().getSolicitud { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(SolicitudesModel.SolicitudesData.self, from: Result.data!) as SolicitudesModel.SolicitudesData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}
