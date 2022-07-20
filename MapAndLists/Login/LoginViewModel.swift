//
//  LoginViewModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/06/22.
//

import Foundation

class LoginViewModel {
    
    func postLogin(parameters:LoginStruct,completion: @escaping (LoginModel.LoginModelData?) -> ()) {
        
        LoginAPIClient().postLogin(parameters: parameters) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(LoginModel.LoginModelData.self, from: Result.data!) as LoginModel.LoginModelData {
                    
                    completion(data)
                }
                
            case .failure(_):
                
                completion(nil)
                
            }
        }
    }
}
