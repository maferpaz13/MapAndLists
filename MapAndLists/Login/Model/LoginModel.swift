//
//  LoginModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/06/22.
//

import Foundation

class LoginModel {
    
struct LoginModelData : Codable {
    let success : Bool?
    let message : String?
    let data : Data?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case data = "data"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Current_sign_in_ip : Codable {
    let family : Int?
    let addr : Int?
    let mask_addr : Int?

    enum CodingKeys: String, CodingKey {

        case family = "family"
        case addr = "addr"
        case mask_addr = "mask_addr"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        family = try values.decodeIfPresent(Int.self, forKey: .family)
        addr = try values.decodeIfPresent(Int.self, forKey: .addr)
        mask_addr = try values.decodeIfPresent(Int.self, forKey: .mask_addr)
    }

}

struct Last_sign_in_ip : Codable {
    let family : Int?
    let addr : Int?
    let mask_addr : Int?

    enum CodingKeys: String, CodingKey {

        case family = "family"
        case addr = "addr"
        case mask_addr = "mask_addr"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        family = try values.decodeIfPresent(Int.self, forKey: .family)
        addr = try values.decodeIfPresent(Int.self, forKey: .addr)
        mask_addr = try values.decodeIfPresent(Int.self, forKey: .mask_addr)
    }

}

struct Photo_bigcustomer : Codable {
    let url : String?

    enum CodingKeys: String, CodingKey {

        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}

struct Photo_loadgenerator : Codable {
    let url : String?

    enum CodingKeys: String, CodingKey {

        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
    
struct Data : Codable {
    let id : Int?
    let firstname : String?
    let secondname : String?
    let lastname : String?
    let lastname2 : String?
    let celularphone : String?
    let email : String?
    let sign_in_count : Int?
    let current_sign_in_at : String?
    let last_sign_in_at : String?
    let current_sign_in_ip : Current_sign_in_ip?
    let last_sign_in_ip : Last_sign_in_ip?
    let failed_attempts : Int?
    let created_at : String?
    let updated_at : String?
    let token : String?
    let loadgenerator_id : Int?
    let country_id : Int?
    let bigcustomer_id : Int?
    let device_token : String?
    let uuid : String?
    let is_distribution_driver : Bool?
    let is_billable : Bool?
    let is_client_spot : Bool?
    let usertype : Int?
    let active : Bool?
    let is_movilizator : Bool?
    let is_mechanic : Bool?
    let is_inspector : Bool?
    let is_coordinator : Bool?
    let use_only_api : Bool?
    let fletx : Bool?
    let transer : Bool?
    let photo_loadgenerator : Photo_loadgenerator?
    let bigcustomer : String?
    let photo_bigcustomer : Photo_bigcustomer?
    let bigcustomer_uuid : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case firstname = "firstname"
        case secondname = "secondname"
        case lastname = "lastname"
        case lastname2 = "lastname2"
        case celularphone = "celularphone"
        case email = "email"
        case sign_in_count = "sign_in_count"
        case current_sign_in_at = "current_sign_in_at"
        case last_sign_in_at = "last_sign_in_at"
        case current_sign_in_ip = "current_sign_in_ip"
        case last_sign_in_ip = "last_sign_in_ip"
        case failed_attempts = "failed_attempts"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case token = "token"
        case loadgenerator_id = "loadgenerator_id"
        case country_id = "country_id"
        case bigcustomer_id = "bigcustomer_id"
        case device_token = "device_token"
        case uuid = "uuid"
        case is_distribution_driver = "is_distribution_driver"
        case is_billable = "is_billable"
        case is_client_spot = "is_client_spot"
        case usertype = "usertype"
        case active = "active"
        case is_movilizator = "is_movilizator"
        case is_mechanic = "is_mechanic"
        case is_inspector = "is_inspector"
        case is_coordinator = "is_coordinator"
        case use_only_api = "use_only_api"
        case fletx = "fletx"
        case transer = "transer"
        case photo_loadgenerator = "photo_loadgenerator"
        case bigcustomer = "bigcustomer"
        case photo_bigcustomer = "photo_bigcustomer"
        case bigcustomer_uuid = "bigcustomer_uuid"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
        secondname = try values.decodeIfPresent(String.self, forKey: .secondname)
        lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
        lastname2 = try values.decodeIfPresent(String.self, forKey: .lastname2)
        celularphone = try values.decodeIfPresent(String.self, forKey: .celularphone)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        sign_in_count = try values.decodeIfPresent(Int.self, forKey: .sign_in_count)
        current_sign_in_at = try values.decodeIfPresent(String.self, forKey: .current_sign_in_at)
        last_sign_in_at = try values.decodeIfPresent(String.self, forKey: .last_sign_in_at)
        current_sign_in_ip = try values.decodeIfPresent(Current_sign_in_ip.self, forKey: .current_sign_in_ip)
        last_sign_in_ip = try values.decodeIfPresent(Last_sign_in_ip.self, forKey: .last_sign_in_ip)
        failed_attempts = try values.decodeIfPresent(Int.self, forKey: .failed_attempts)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        loadgenerator_id = try values.decodeIfPresent(Int.self, forKey: .loadgenerator_id)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
        bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
        device_token = try values.decodeIfPresent(String.self, forKey: .device_token)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        is_distribution_driver = try values.decodeIfPresent(Bool.self, forKey: .is_distribution_driver)
        is_billable = try values.decodeIfPresent(Bool.self, forKey: .is_billable)
        is_client_spot = try values.decodeIfPresent(Bool.self, forKey: .is_client_spot)
        usertype = try values.decodeIfPresent(Int.self, forKey: .usertype)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        is_movilizator = try values.decodeIfPresent(Bool.self, forKey: .is_movilizator)
        is_mechanic = try values.decodeIfPresent(Bool.self, forKey: .is_mechanic)
        is_inspector = try values.decodeIfPresent(Bool.self, forKey: .is_inspector)
        is_coordinator = try values.decodeIfPresent(Bool.self, forKey: .is_coordinator)
        use_only_api = try values.decodeIfPresent(Bool.self, forKey: .use_only_api)
        fletx = try values.decodeIfPresent(Bool.self, forKey: .fletx)
        transer = try values.decodeIfPresent(Bool.self, forKey: .transer)
        photo_loadgenerator = try values.decodeIfPresent(Photo_loadgenerator.self, forKey: .photo_loadgenerator)
        bigcustomer = try values.decodeIfPresent(String.self, forKey: .bigcustomer)
        photo_bigcustomer = try values.decodeIfPresent(Photo_bigcustomer.self, forKey: .photo_bigcustomer)
        bigcustomer_uuid = try values.decodeIfPresent(String.self, forKey: .bigcustomer_uuid)
        }

    }

}
