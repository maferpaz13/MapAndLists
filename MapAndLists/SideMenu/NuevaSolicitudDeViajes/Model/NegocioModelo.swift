//
//  NegocioModelo.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation

class NegocioModelo {
    
    struct NegocioData : Codable {
        let success : Bool?
        let data : [Datas]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            data = try values.decodeIfPresent([Datas].self, forKey: .data)
        }

    }

    
    struct Datas : Codable {
        let id : Int?
        let bigcustomers_id : Int?
        let date_from : String?
        let date_to : String?
        let businesstype_id : Int?
        let standby : Bool?
        let standbyvalue : String?
        let created_at : String?
        let updated_at : String?
        let description : String?
        let receive_standby : Bool?
        let load : Bool?
        let value_load : String?
        let unload : Bool?
        let value_unload : String?
        let kind : Int?
        let attended_by : Int?
        let carp : Bool?
        let value_carp : String?
        let descarp : Bool?
        let value_descarp : String?
        let enlistment : Bool?
        let value_enlistment : String?
        let exclusive_fleet : Bool?
        let choose_sider : Bool?
        let has_auction : Bool?
        let is_circuit : Bool?
        let round_trip : Bool?
        let quality_inspection : Bool?
        let manage_paper : Bool?
        let big_distance : Bool?
        let able_terpel_tickets : Bool?
        let transport_company_id : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case bigcustomers_id = "bigcustomers_id"
            case date_from = "date_from"
            case date_to = "date_to"
            case businesstype_id = "businesstype_id"
            case standby = "standby"
            case standbyvalue = "standbyvalue"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case description = "description"
            case receive_standby = "receive_standby"
            case load = "load"
            case value_load = "value_load"
            case unload = "unload"
            case value_unload = "value_unload"
            case kind = "kind"
            case attended_by = "attended_by"
            case carp = "carp"
            case value_carp = "value_carp"
            case descarp = "descarp"
            case value_descarp = "value_descarp"
            case enlistment = "enlistment"
            case value_enlistment = "value_enlistment"
            case exclusive_fleet = "exclusive_fleet"
            case choose_sider = "choose_sider"
            case has_auction = "has_auction"
            case is_circuit = "is_circuit"
            case round_trip = "round_trip"
            case quality_inspection = "quality_inspection"
            case manage_paper = "manage_paper"
            case big_distance = "big_distance"
            case able_terpel_tickets = "able_terpel_tickets"
            case transport_company_id = "transport_company_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            bigcustomers_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomers_id)
            date_from = try values.decodeIfPresent(String.self, forKey: .date_from)
            date_to = try values.decodeIfPresent(String.self, forKey: .date_to)
            businesstype_id = try values.decodeIfPresent(Int.self, forKey: .businesstype_id)
            standby = try values.decodeIfPresent(Bool.self, forKey: .standby)
            standbyvalue = try values.decodeIfPresent(String.self, forKey: .standbyvalue)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            receive_standby = try values.decodeIfPresent(Bool.self, forKey: .receive_standby)
            load = try values.decodeIfPresent(Bool.self, forKey: .load)
            value_load = try values.decodeIfPresent(String.self, forKey: .value_load)
            unload = try values.decodeIfPresent(Bool.self, forKey: .unload)
            value_unload = try values.decodeIfPresent(String.self, forKey: .value_unload)
            kind = try values.decodeIfPresent(Int.self, forKey: .kind)
            attended_by = try values.decodeIfPresent(Int.self, forKey: .attended_by)
            carp = try values.decodeIfPresent(Bool.self, forKey: .carp)
            value_carp = try values.decodeIfPresent(String.self, forKey: .value_carp)
            descarp = try values.decodeIfPresent(Bool.self, forKey: .descarp)
            value_descarp = try values.decodeIfPresent(String.self, forKey: .value_descarp)
            enlistment = try values.decodeIfPresent(Bool.self, forKey: .enlistment)
            value_enlistment = try values.decodeIfPresent(String.self, forKey: .value_enlistment)
            exclusive_fleet = try values.decodeIfPresent(Bool.self, forKey: .exclusive_fleet)
            choose_sider = try values.decodeIfPresent(Bool.self, forKey: .choose_sider)
            has_auction = try values.decodeIfPresent(Bool.self, forKey: .has_auction)
            is_circuit = try values.decodeIfPresent(Bool.self, forKey: .is_circuit)
            round_trip = try values.decodeIfPresent(Bool.self, forKey: .round_trip)
            quality_inspection = try values.decodeIfPresent(Bool.self, forKey: .quality_inspection)
            manage_paper = try values.decodeIfPresent(Bool.self, forKey: .manage_paper)
            big_distance = try values.decodeIfPresent(Bool.self, forKey: .big_distance)
            able_terpel_tickets = try values.decodeIfPresent(Bool.self, forKey: .able_terpel_tickets)
            transport_company_id = try values.decodeIfPresent(Int.self, forKey: .transport_company_id)
        }

    }

    
}
