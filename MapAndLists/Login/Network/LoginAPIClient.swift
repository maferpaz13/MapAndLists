//
//  LoginAPIClient.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/06/22.
//

import Foundation
import Alamofire

class LoginAPIClient{
    
    func postLogin(parameters:LoginStruct,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        
        AF.request(EndPoints.domain+URLPost.signin, method: .post, parameters: parameters.dict, encoding: JSONEncoding.default).responseData {
            
            (Result) in
            completion(Result)
        }
        
    }
}
