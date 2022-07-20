//
//  direccionModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import Foundation

class direccionModel {
    
    struct direccionDatas : Codable {
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
        let contact_name : String?
        let contact_phone : String?
        let department_id : Int?
        let city_id : Int?
        let address_text : String?
        let created_at : String?
        let updated_at : String?
        let status : Int?
        let lat : String?
        let lng : String?
        let lonlat : String?
        let name : String?
        let estimated_charging_time : Int?
        let estimated_download_time : Int?
        let polypoints : String?
        let radio_distance_m : Double?
        let partner_id : Int?
        let minutes_estimated_load : Int?
        let minutes_estimated_unload : Int?
        let allows_load_outside_geofence : Bool?
        let big_distance : Bool?
        let port_appointment : Bool?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case contact_name = "contact_name"
            case contact_phone = "contact_phone"
            case department_id = "department_id"
            case city_id = "city_id"
            case address_text = "address_text"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case status = "status"
            case lat = "lat"
            case lng = "lng"
            case lonlat = "lonlat"
            case name = "name"
            case estimated_charging_time = "estimated_charging_time"
            case estimated_download_time = "estimated_download_time"
            case polypoints = "polypoints"
            case radio_distance_m = "radio_distance_m"
            case partner_id = "partner_id"
            case minutes_estimated_load = "minutes_estimated_load"
            case minutes_estimated_unload = "minutes_estimated_unload"
            case allows_load_outside_geofence = "allows_load_outside_geofence"
            case big_distance = "big_distance"
            case port_appointment = "port_appointment"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            contact_name = try values.decodeIfPresent(String.self, forKey: .contact_name)
            contact_phone = try values.decodeIfPresent(String.self, forKey: .contact_phone)
            department_id = try values.decodeIfPresent(Int.self, forKey: .department_id)
            city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
            address_text = try values.decodeIfPresent(String.self, forKey: .address_text)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            lat = try values.decodeIfPresent(String.self, forKey: .lat)
            lng = try values.decodeIfPresent(String.self, forKey: .lng)
            lonlat = try values.decodeIfPresent(String.self, forKey: .lonlat)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            estimated_charging_time = try values.decodeIfPresent(Int.self, forKey: .estimated_charging_time)
            estimated_download_time = try values.decodeIfPresent(Int.self, forKey: .estimated_download_time)
            polypoints = try values.decodeIfPresent(String.self, forKey: .polypoints)
            radio_distance_m = try values.decodeIfPresent(Double.self, forKey: .radio_distance_m)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
            minutes_estimated_load = try values.decodeIfPresent(Int.self, forKey: .minutes_estimated_load)
            minutes_estimated_unload = try values.decodeIfPresent(Int.self, forKey: .minutes_estimated_unload)
            allows_load_outside_geofence = try values.decodeIfPresent(Bool.self, forKey: .allows_load_outside_geofence)
            big_distance = try values.decodeIfPresent(Bool.self, forKey: .big_distance)
            port_appointment = try values.decodeIfPresent(Bool.self, forKey: .port_appointment)
        }

    }

    
}
