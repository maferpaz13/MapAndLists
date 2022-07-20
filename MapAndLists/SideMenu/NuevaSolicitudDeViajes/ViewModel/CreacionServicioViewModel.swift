//
//  NegocioAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation

class CreacionServicioViewModel {
    
    func getNegocio(completion: @escaping (NegocioModelo.NegocioData?) -> ()){
        NegocioAPIClient().getNegocio{ (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(NegocioModelo.NegocioData.self, from: Result.data!) as NegocioModelo.NegocioData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getConfiguracion(completion: @escaping (ConfiguracionModelo.ConfiguracionData?)->()){
        
        ConfiguracionAPIClient().getConfiguracion { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(ConfiguracionModelo.ConfiguracionData.self, from: Result.data!) as ConfiguracionModelo.ConfiguracionData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getTipoVeh(completion: @escaping (TipoVehModelo.TipoVehData?)->()){
        
        TipoVehAPIClient().getTipoVeh { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(TipoVehModelo.TipoVehData.self, from: Result.data!) as TipoVehModelo.TipoVehData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getRuta(id: Int, completion: @escaping (RutaModelo.RutaData?)->()){
        
        RutaAPIClient().getRuta(id: id){ (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(RutaModelo.RutaData.self, from: Result.data!) as RutaModelo.RutaData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
    
    func getTipoSolicitud(completion: @escaping (TipoSolicitudModelo.TipoSolicitudData?)->()){
        
        TipoSolicitudAPIClient().getTipoSolicitud { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(TipoSolicitudModelo.TipoSolicitudData.self, from: Result.data!) as TipoSolicitudModelo.TipoSolicitudData {
                    
                    completion(data)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
}
