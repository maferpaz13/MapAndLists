//
//  NegocioModelo.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation

class TipoVehModelo {
    
    struct TipoVehData : Codable {
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
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let url : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
}
