//
//  ActPlantaModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation

class ActPlantaModel {
    
    struct ActPlantaData : Codable {
        let success : Bool?
        let plants : [Plants]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case plants = "plants"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            plants = try values.decodeIfPresent([Plants].self, forKey: .plants)
        }

    }

    
    struct Plants : Codable {
        let id : Int?
        let polypoints_json : [Polypoints_json]?
        let address_text : String?
        let allows_load_outside_geofence : Bool?
        let contact_name : String?
        let contact_phone : String?
        let radio_distance_m : Double?
        let estimated_charging_time : Int?
        let estimated_download_time : Int?
        let lat : String?
        let lng : String?
        let lonlat : String?
        let minutes_estimated_load : Int?
        let minutes_estimated_unload : Int?
        let name : String?
        let status : Int?
        let zip_code : String?
        let city_id : Int?
        let department_id : Int?
        let loadgenerator_id : Int?
        let partner_id : Int?
        let updated_at : String?
        let created_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case polypoints_json = "polypoints_json"
            case address_text = "address_text"
            case allows_load_outside_geofence = "allows_load_outside_geofence"
            case contact_name = "contact_name"
            case contact_phone = "contact_phone"
            case radio_distance_m = "radio_distance_m"
            case estimated_charging_time = "estimated_charging_time"
            case estimated_download_time = "estimated_download_time"
            case lat = "lat"
            case lng = "lng"
            case lonlat = "lonlat"
            case minutes_estimated_load = "minutes_estimated_load"
            case minutes_estimated_unload = "minutes_estimated_unload"
            case name = "name"
            case status = "status"
            case zip_code = "zip_code"
            case city_id = "city_id"
            case department_id = "department_id"
            case loadgenerator_id = "loadgenerator_id"
            case partner_id = "partner_id"
            case updated_at = "updated_at"
            case created_at = "created_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            polypoints_json = try values.decodeIfPresent([Polypoints_json].self, forKey: .polypoints_json)
            address_text = try values.decodeIfPresent(String.self, forKey: .address_text)
            allows_load_outside_geofence = try values.decodeIfPresent(Bool.self, forKey: .allows_load_outside_geofence)
            contact_name = try values.decodeIfPresent(String.self, forKey: .contact_name)
            contact_phone = try values.decodeIfPresent(String.self, forKey: .contact_phone)
            radio_distance_m = try values.decodeIfPresent(Double.self, forKey: .radio_distance_m)
            estimated_charging_time = try values.decodeIfPresent(Int.self, forKey: .estimated_charging_time)
            estimated_download_time = try values.decodeIfPresent(Int.self, forKey: .estimated_download_time)
            lat = try values.decodeIfPresent(String.self, forKey: .lat)
            lng = try values.decodeIfPresent(String.self, forKey: .lng)
            lonlat = try values.decodeIfPresent(String.self, forKey: .lonlat)
            minutes_estimated_load = try values.decodeIfPresent(Int.self, forKey: .minutes_estimated_load)
            minutes_estimated_unload = try values.decodeIfPresent(Int.self, forKey: .minutes_estimated_unload)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
            city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
            department_id = try values.decodeIfPresent(Int.self, forKey: .department_id)
            loadgenerator_id = try values.decodeIfPresent(Int.self, forKey: .loadgenerator_id)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        }

    }

    
    struct Polypoints_json : Codable {
        let lat : String?
        let lng : String?

        enum CodingKeys: String, CodingKey {

            case lat = "lat"
            case lng = "lng"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            lat = try values.decodeIfPresent(String.self, forKey: .lat)
            lng = try values.decodeIfPresent(String.self, forKey: .lng)
        }

    }
    
}
