//
//  UbicacionVehModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 22/06/22.
//

import Foundation

class UbicacionVehModel {
    
    struct UbicacionVehData : Codable {
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
        let bigcustomer_id : Int?
        let request_id : Int?
        let driver_name : String?
        let placa : String?
        let cartype : String?
        let carconfig : String?
        let car_mark : String?
        let car_line : String?
        let longitude : Double?
        let latitude : Double?
        let vehicle_thirdstate : String?
        let carconfig_id : Int?
        let rotation : Double?
        let placa_trailer : String?
        let front_photo : String?
        let is_owner : Bool?

        enum CodingKeys: String, CodingKey {

            case bigcustomer_id = "bigcustomer_id"
            case request_id = "request_id"
            case driver_name = "driver_name"
            case placa = "placa"
            case cartype = "cartype"
            case carconfig = "carconfig"
            case car_mark = "car_mark"
            case car_line = "car_line"
            case longitude = "longitude"
            case latitude = "latitude"
            case vehicle_thirdstate = "vehicle_thirdstate"
            case carconfig_id = "carconfig_id"
            case rotation = "rotation"
            case placa_trailer = "placa_trailer"
            case front_photo = "front_photo"
            case is_owner = "is_owner"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
            request_id = try values.decodeIfPresent(Int.self, forKey: .request_id)
            driver_name = try values.decodeIfPresent(String.self, forKey: .driver_name)
            placa = try values.decodeIfPresent(String.self, forKey: .placa)
            cartype = try values.decodeIfPresent(String.self, forKey: .cartype)
            carconfig = try values.decodeIfPresent(String.self, forKey: .carconfig)
            car_mark = try values.decodeIfPresent(String.self, forKey: .car_mark)
            car_line = try values.decodeIfPresent(String.self, forKey: .car_line)
            longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
            latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
            vehicle_thirdstate = try values.decodeIfPresent(String.self, forKey: .vehicle_thirdstate)
            carconfig_id = try values.decodeIfPresent(Int.self, forKey: .carconfig_id)
            rotation = try values.decodeIfPresent(Double.self, forKey: .rotation)
            placa_trailer = try values.decodeIfPresent(String.self, forKey: .placa_trailer)
            front_photo = try values.decodeIfPresent(String.self, forKey: .front_photo)
            is_owner = try values.decodeIfPresent(Bool.self, forKey: .is_owner)
        }

    }
}
