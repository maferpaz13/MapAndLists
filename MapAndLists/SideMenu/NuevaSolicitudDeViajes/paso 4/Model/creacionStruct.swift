//
//  creacionStruct.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 18/07/22.
//

import Foundation

struct creaccionStruct {
    
    var dict = [
            
            "commercial_booking" : [
                
                    "business_id" : 0,
                    "booking_type_id": 0,
                    "businessroute_id": 0,
                    "cantcar": 1,
                    "carconfig_id": 0,
                    "cartype_id": 0,
                    "office_dispatch_id": 0,
                    "emite_id": 0,
                    "recibe_id": 0,
                    "paga_id": 0,
                    "has_a_loading_date": false,
                    "date": "",//"yyyy-MM-dd HH:mm:ss"
                    "date2": "",//"yyyy-MM-dd"
                    "loading_time_slot":0,
                    "exclusive_fleet": "",
                    "manage_paper": "",
                    "comment": "",
                    "observation_client":"",
                    "bigcustomer_id": 0
                    
            ],
            "booking_address": [ "" : "" ],
            "booking_products": [ "" : "" ]
    ] as [String: Any]
    
    init(business_id: Int, booking_type_id: Int, businessroute_id: Int, cantcar: Int, carconfig_id: Int, cartype_id: Int, office_dispatch_id: Int, emite_id: Int, recibe_id: Int, paga_id: Int, has_a_loading_date: Int, date: String, date2: String, loading_time_slot: Int, exclusive_fleet: String, manage_paper: String, comment: String, observation_client: String, bigcustomer_id: Int, booking_address: Any?, booking_products: Any?){
        
        dict["commercial_booking"] = [
            "business_id" : business_id,
            "booking_type_id" : booking_type_id,
            "businessroute_id" : businessroute_id,
            "cantcar" : cantcar,
            "carconfig_id" : carconfig_id,
            "cartype_id" : cartype_id,
            "office_dispatch_id" : office_dispatch_id,
            "emite_id" : emite_id,
            "recibe_id" : recibe_id,
            "paga_id" : paga_id,
            "has_a_loading_date" : has_a_loading_date,
            "date" : date,
            "date2" : date2,
            "loading_time_slot" : loading_time_slot,
            "exclusive_fleet" : exclusive_fleet,
            "manage_paper" : manage_paper,
            "comment" : comment,
            "observation_client" : observation_client,
            "bigcustomer_id" : bigcustomer_id
            ]
        
        dict["booking_address"] = booking_address
        dict["booking_products"] = booking_products
        
    }
}
