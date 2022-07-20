//
//  Cities_Model.swift
//  Fletx Driver
//
//  Created by Dev IOS on 3/01/22.
//  Copyright © 2022 leonel.alfonso. All rights reserved.
//

import Foundation

public class Cities{
    

    public struct Datas : Hashable {
        
        
        let id : Int?
        let department_id : Int?
        let department : Department?
        let name : String?
        let lat : String?
        let lng : String?
        let location_type : String?
        let created_at : String?
        let updated_at : String?
        let url : String?
        
        

    }
    
    public struct Department : Hashable {
        
        let id : Int?
        let name : String?
        let created_at : String?
        let updated_at : String?
        let countries_id : Int?
        let partner_id : Int?
        let siesa_code : Int?
        

    }
    
}
