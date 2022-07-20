//
//  productosModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 18/07/22.
//

import Foundation

class productosModel {
    
    struct productosData : Codable {
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
        let name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }

    }

    
}
