//
//  LoginStruct.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/06/22.
//

import Foundation

struct LoginStruct {
    var dict = [
        
        "email" : "",
        "password": ""
        
        ] as [String: Any]
    
    init(email: String, password: String){
        
        dict["email"] = email
        dict["password"] = password
    }
}
