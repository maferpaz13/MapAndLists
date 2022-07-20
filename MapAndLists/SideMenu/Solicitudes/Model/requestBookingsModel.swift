//
//  requestBookingsModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 11/07/22.
//

import Foundation

class requestBokingsModel {
    
    struct requestBokingsData : Codable {
        let success : Bool?
        let message : String?
        let data : [VehCargueDescargueModel.Vehicles_load]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent([VehCargueDescargueModel.Vehicles_load].self, forKey: .data)
        }

    }
    
}
