//
//  NegocioModelo.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 12/07/22.
//

import Foundation

class ConfiguracionModelo {
    
    struct ConfiguracionData : Codable {
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
        let code : String?
        let description : String?
        let capacity : Int?
        let status : Int?
        let countries_id : Int?
        let order : Int?
        let image : Image?
        let created_at : String?
        let updated_at : String?
        let url : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case code = "code"
            case description = "description"
            case capacity = "capacity"
            case status = "status"
            case countries_id = "countries_id"
            case order = "order"
            case image = "image"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            countries_id = try values.decodeIfPresent(Int.self, forKey: .countries_id)
            order = try values.decodeIfPresent(Int.self, forKey: .order)
            image = try values.decodeIfPresent(Image.self, forKey: .image)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }
    
    struct Image : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            do{
                url = try values.decodeIfPresent(String.self, forKey: .url)
                
            }catch{
                url = ""
            }
        }

    }


    
}
