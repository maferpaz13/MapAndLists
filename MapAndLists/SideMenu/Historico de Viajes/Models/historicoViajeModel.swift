//
//  File.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation

class historicoViajeModel {
    
    struct historicoViajeData : Codable {
        let success : Bool?
        let type : String?
        let requests : [Requests]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case type = "type"
            case requests = "requests"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            requests = try values.decodeIfPresent([Requests].self, forKey: .requests)
        }

    }

    
    struct Requests : Codable {
        let bigcustomer_id : Int?
        let request_id : Int?
        let created_at : String?
        let loading_date : String?
        let fringe_time : String?
        let requeststatus_id : Int?
        let request_status : String?
        let city_origin : String?
        let city_destin : String?
        let ministry_product : String?
        let commercial_product : String?

        enum CodingKeys: String, CodingKey {

            case bigcustomer_id = "bigcustomer_id"
            case request_id = "request_id"
            case created_at = "created_at"
            case loading_date = "loading_date"
            case fringe_time = "fringe_time"
            case requeststatus_id = "requeststatus_id"
            case request_status = "request_status"
            case city_origin = "city_origin"
            case city_destin = "city_destin"
            case ministry_product = "ministry_product"
            case commercial_product = "commercial_product"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
            request_id = try values.decodeIfPresent(Int.self, forKey: .request_id)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            loading_date = try values.decodeIfPresent(String.self, forKey: .loading_date)
            fringe_time = try values.decodeIfPresent(String.self, forKey: .fringe_time)
            requeststatus_id = try values.decodeIfPresent(Int.self, forKey: .requeststatus_id)
            request_status = try values.decodeIfPresent(String.self, forKey: .request_status)
            city_origin = try values.decodeIfPresent(String.self, forKey: .city_origin)
            city_destin = try values.decodeIfPresent(String.self, forKey: .city_destin)
            ministry_product = try values.decodeIfPresent(String.self, forKey: .ministry_product)
            commercial_product = try values.decodeIfPresent(String.self, forKey: .commercial_product)
        }

    }

    
}
