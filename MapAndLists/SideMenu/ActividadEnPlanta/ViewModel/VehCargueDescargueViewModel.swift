//
//  VehCargueDescargueViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation
import Alamofire

class VehCargueDescargueViewModel {
    
    func getVehCargueDescargue(id: Int,completion: @escaping (VehCargueDescargueModel.VehCargueDescargueDatas?) -> ()){
        
        VehCargueDescargueAPIClient().getCarDescar(id: id) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(VehCargueDescargueModel.VehCargueDescargueDatas.self, from: Result.data!) as VehCargueDescargueModel.VehCargueDescargueDatas {
                    
                    completion(data)
                }else{
                    
                    print("No pude decodificar la info")
                    completion(nil)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
        
    }
    
}
