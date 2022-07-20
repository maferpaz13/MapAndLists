//
//  CreacionServ2ViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 15/07/22.
//

import Foundation

class CreacionServ2ViewModel {
    
    func getemite(completion: @escaping (emiteModel.emiteData?) -> ()){
        emiteAPIClient().getemite { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(emiteModel.emiteData.self, from: Result.data!) as emiteModel.emiteData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getpaga(completion: @escaping (pagaModel.pagaData?) -> ()){
        pagaAPIClient().getpaga { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(pagaModel.pagaData.self, from: Result.data!) as pagaModel.pagaData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getrecibe(completion: @escaping (recibeModel.recibeData?) -> ()){
        recibeAPIClient().getrecibe{ (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(recibeModel.recibeData.self, from: Result.data!) as recibeModel.recibeData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
}
