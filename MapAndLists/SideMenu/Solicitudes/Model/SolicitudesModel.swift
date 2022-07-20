//
//  SolicitudesModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 10/07/22.
//

import Foundation

class SolicitudesModel {
    
    struct SolicitudesData : Codable {
        let success : Bool?
        let message : String?
        let data : [Datas]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent([Datas].self, forKey: .data)
        }

    }

    
    struct Datas : Codable {
        let id : Int?
        let cantcar : Int?
        let cartype_id : Int?
        let cartype : Cartype?
        let carconfig_id : Int?
        let carconfig : Carconfig?
        let business_id : Int?
        let business : Business?
        let businessroute_id : Int?
        let date : String?
        let emite_id : Int?
        let recibe_id : Int?
        let paga_id : Int?
        let bigcustomer_id : Int?
        let charge_for : Int?
        let has_a_loading_date : Bool?
        let updateby_id : Int?
        let exclusive_fleet : Bool?
        let is_circuit : Bool?
        let booking_type_id : Int?
        let comment : String?
        let observation_client : String?
        let office_dispatch_id : Int?
        let big_distance : Bool?
        let booking_address : [Booking_address]?
        let created_at : String?
        let updated_at : String?
        let route_name : String?
        let estimated_loading_date : String?
        let negotiated : String?
        let products : [String]?
        let url : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case cantcar = "cantcar"
            case cartype_id = "cartype_id"
            case cartype = "cartype"
            case carconfig_id = "carconfig_id"
            case carconfig = "carconfig"
            case business_id = "business_id"
            case business = "business"
            case businessroute_id = "businessroute_id"
            case date = "date"
            case emite_id = "emite_id"
            case recibe_id = "recibe_id"
            case paga_id = "paga_id"
            case bigcustomer_id = "bigcustomer_id"
            case charge_for = "charge_for"
            case has_a_loading_date = "has_a_loading_date"
            case updateby_id = "updateby_id"
            case exclusive_fleet = "exclusive_fleet"
            case is_circuit = "is_circuit"
            case booking_type_id = "booking_type_id"
            case comment = "comment"
            case observation_client = "observation_client"
            case office_dispatch_id = "office_dispatch_id"
            case big_distance = "big_distance"
            case booking_address = "booking_address"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case route_name = "route_name"
            case estimated_loading_date = "estimated_loading_date"
            case negotiated = "negotiated"
            case products = "products"
            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            cantcar = try values.decodeIfPresent(Int.self, forKey: .cantcar)
            cartype_id = try values.decodeIfPresent(Int.self, forKey: .cartype_id)
            cartype = try values.decodeIfPresent(Cartype.self, forKey: .cartype)
            carconfig_id = try values.decodeIfPresent(Int.self, forKey: .carconfig_id)
            carconfig = try values.decodeIfPresent(Carconfig.self, forKey: .carconfig)
            business_id = try values.decodeIfPresent(Int.self, forKey: .business_id)
            business = try values.decodeIfPresent(Business.self, forKey: .business)
            businessroute_id = try values.decodeIfPresent(Int.self, forKey: .businessroute_id)
            date = try values.decodeIfPresent(String.self, forKey: .date)
            emite_id = try values.decodeIfPresent(Int.self, forKey: .emite_id)
            recibe_id = try values.decodeIfPresent(Int.self, forKey: .recibe_id)
            paga_id = try values.decodeIfPresent(Int.self, forKey: .paga_id)
            bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
            charge_for = try values.decodeIfPresent(Int.self, forKey: .charge_for)
            has_a_loading_date = try values.decodeIfPresent(Bool.self, forKey: .has_a_loading_date)
            updateby_id = try values.decodeIfPresent(Int.self, forKey: .updateby_id)
            exclusive_fleet = try values.decodeIfPresent(Bool.self, forKey: .exclusive_fleet)
            is_circuit = try values.decodeIfPresent(Bool.self, forKey: .is_circuit)
            booking_type_id = try values.decodeIfPresent(Int.self, forKey: .booking_type_id)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            observation_client = try values.decodeIfPresent(String.self, forKey: .observation_client)
            office_dispatch_id = try values.decodeIfPresent(Int.self, forKey: .office_dispatch_id)
            big_distance = try values.decodeIfPresent(Bool.self, forKey: .big_distance)
            booking_address = try values.decodeIfPresent([Booking_address].self, forKey: .booking_address)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            route_name = try values.decodeIfPresent(String.self, forKey: .route_name)
            estimated_loading_date = try values.decodeIfPresent(String.self, forKey: .estimated_loading_date)
            negotiated = try values.decodeIfPresent(String.self, forKey: .negotiated)
            products = try values.decodeIfPresent([String].self, forKey: .products)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Business : Codable {
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

    
    struct Carconfig : Codable {
        let id : Int?
        let code : String?
        let description : String?
        let capacity : Int?
        let volume_mt : Int?
        let volume_gl : Int?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let countries_id : Int?
        let image : Image?
        let order : Int?
        let equivalent : [Int]?
        let minimum_weight : Int?
        let apply_cartype : Bool?
        let fletxptos_kms : [Int]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case code = "code"
            case description = "description"
            case capacity = "capacity"
            case volume_mt = "volume_mt"
            case volume_gl = "volume_gl"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case countries_id = "countries_id"
            case image = "image"
            case order = "order"
            case equivalent = "equivalent"
            case minimum_weight = "minimum_weight"
            case apply_cartype = "apply_cartype"
            case fletxptos_kms = "fletxptos_kms"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
            volume_mt = try values.decodeIfPresent(Int.self, forKey: .volume_mt)
            volume_gl = try values.decodeIfPresent(Int.self, forKey: .volume_gl)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            countries_id = try values.decodeIfPresent(Int.self, forKey: .countries_id)
            image = try values.decodeIfPresent(Image.self, forKey: .image)
            order = try values.decodeIfPresent(Int.self, forKey: .order)
            equivalent = try values.decodeIfPresent([Int].self, forKey: .equivalent)
            minimum_weight = try values.decodeIfPresent(Int.self, forKey: .minimum_weight)
            apply_cartype = try values.decodeIfPresent(Bool.self, forKey: .apply_cartype)
            fletxptos_kms = try values.decodeIfPresent([Int].self, forKey: .fletxptos_kms)
        }

    }

    
    struct Image : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Cartype : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let kind : String?
        let code_mint : Int?
        let equivalent : [Int]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case kind = "kind"
            case code_mint = "code_mint"
            case equivalent = "equivalent"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            kind = try values.decodeIfPresent(String.self, forKey: .kind)
            code_mint = try values.decodeIfPresent(Int.self, forKey: .code_mint)
            equivalent = try values.decodeIfPresent([Int].self, forKey: .equivalent)
        }

    }

    
    struct Booking_address : Codable {
        let id : Int?
        let booking_id : Int?
        let address_id : Int?
        let load_address : Bool?
        let unload_address : Bool?
        let is_first : Bool?
        let created_at : String?
        let updated_at : String?
        let out_of_city : Bool?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case booking_id = "booking_id"
            case address_id = "address_id"
            case load_address = "load_address"
            case unload_address = "unload_address"
            case is_first = "is_first"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case out_of_city = "out_of_city"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            booking_id = try values.decodeIfPresent(Int.self, forKey: .booking_id)
            address_id = try values.decodeIfPresent(Int.self, forKey: .address_id)
            load_address = try values.decodeIfPresent(Bool.self, forKey: .load_address)
            unload_address = try values.decodeIfPresent(Bool.self, forKey: .unload_address)
            is_first = try values.decodeIfPresent(Bool.self, forKey: .is_first)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            out_of_city = try values.decodeIfPresent(Bool.self, forKey: .out_of_city)
        }

    }

    
}
