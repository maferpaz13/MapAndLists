//
//  emiteModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 15/07/22.
//

import Foundation


class emiteModel {
    
    struct emiteData : Codable {
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
        let fullname : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case fullname = "fullname"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            fullname = try values.decodeIfPresent(String.self, forKey: .fullname)
        }

    }

    
}
