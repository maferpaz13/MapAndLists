//
//  ClientStruct.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 22/06/22.
//

import Foundation

struct ClientStruct {
    
    var dict = [
    
        "client": ""
        
        
    ] as [String: Any]
    
    init(client: String){
       
        dict["client"] = client
        
        
    }
    
}
