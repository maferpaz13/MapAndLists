//
//  BitacoraDeViajeModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import Foundation

class BitacioraDeViajeModel {
    
    struct BitacoraDeViajeData : Codable {
        let success : Bool?
        let message : String?
        let data : [Data]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent([Data].self, forKey: .data)
        }

    }
    
    struct Data : Codable {
        let id : Int?
        let request_id : Int?
        let requeststatus_id : Int?
        let comment : String?
        let visibility : Bool?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let photo : Photo?
        let verify : Bool?
        let requeststatus : Requeststatus?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case request_id = "request_id"
            case requeststatus_id = "requeststatus_id"
            case comment = "comment"
            case visibility = "visibility"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case photo = "photo"
            case verify = "verify"
            case requeststatus = "requeststatus"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            request_id = try values.decodeIfPresent(Int.self, forKey: .request_id)
            requeststatus_id = try values.decodeIfPresent(Int.self, forKey: .requeststatus_id)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            visibility = try values.decodeIfPresent(Bool.self, forKey: .visibility)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            photo = try values.decodeIfPresent(Photo.self, forKey: .photo)
            verify = try values.decodeIfPresent(Bool.self, forKey: .verify)
            requeststatus = try values.decodeIfPresent(Requeststatus.self, forKey: .requeststatus)
        }

    }

    
    struct Requeststatus : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let is_effective : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case is_effective = "is_effective"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            is_effective = try values.decodeIfPresent(Int.self, forKey: .is_effective)
        }

    }
    
    struct Photo : Codable {
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
