//
//  VehCargueDescargueModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 7/07/22.
//

import Foundation

class VehCargueDescargueModel {
    
    struct VehCargueDescargueDatas: Codable {
        let success : Bool?
        let message : String?
        let document_requests_link : [Document_requests_link]?
        let vehicles_load : [Vehicles_load]?
        let vehicles_unload : [Vehicles_load]?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case document_requests_link = "document_requests_link"
            case vehicles_load = "vehicles_load"
            case vehicles_unload = "vehicles_unload"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            document_requests_link = try values.decodeIfPresent([Document_requests_link].self, forKey: .document_requests_link)
            vehicles_load = try values.decodeIfPresent([Vehicles_load].self, forKey: .vehicles_load)
            vehicles_unload = try values.decodeIfPresent([Vehicles_load].self, forKey: .vehicles_unload)
        }
    }
    
    struct Modality : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }
    
    struct Route_image : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Back_card : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Photo_tecnomecanica : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Negotiatedby : Codable {
        let id : Int?
        let name : String?
        let value : Double?
        let status : Int?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value = "value"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            value = try values.decodeIfPresent(Double.self, forKey: .value)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }

    
    struct Soat_photo : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Front_card : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Profile : Codable {
        let config : Config?
        let soat : Soat?
        let tecnomecanica : Tecnomecanica?
        let expired_documents : [String]?

        enum CodingKeys: String, CodingKey {

            case config = "config"
            case soat = "soat"
            case tecnomecanica = "tecnomecanica"
            case expired_documents = "expired_documents"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            config = try values.decodeIfPresent(Config.self, forKey: .config)
            soat = try values.decodeIfPresent(Soat.self, forKey: .soat)
            tecnomecanica = try values.decodeIfPresent(Tecnomecanica.self, forKey: .tecnomecanica)
            expired_documents = try values.decodeIfPresent([String].self, forKey: .expired_documents)
        }

    }

    
    struct Requeststatus : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let description : String?
        let is_effective : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case description = "description"
            case is_effective = "is_effective"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            do{
                description = try values.decodeIfPresent(String.self, forKey: .description)
                
            }catch{
                description = ""
            }
            is_effective = try values.decodeIfPresent(Int.self, forKey: .is_effective)
        }

    }

    
    struct Picture : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Document_requests_link : Codable {
        let request_id : Int?
        let loading_order : String?
        let timesheet : String?
        let manifest : String?

        enum CodingKeys: String, CodingKey {

            case request_id = "request_id"
            case loading_order = "loading_order"
            case timesheet = "timesheet"
            case manifest = "manifest"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            request_id = try values.decodeIfPresent(Int.self, forKey: .request_id)
            loading_order = try values.decodeIfPresent(String.self, forKey: .loading_order)
            timesheet = try values.decodeIfPresent(String.self, forKey: .timesheet)
            manifest = try values.decodeIfPresent(String.self, forKey: .manifest)
        }

    }

    
    struct Legality_merchandise_file : Codable {
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

    
    struct Config : Codable {
        let chassis_number : String?
        let engine_number : String?

        enum CodingKeys: String, CodingKey {

            case chassis_number = "chassis_number"
            case engine_number = "engine_number"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            chassis_number = try values.decodeIfPresent(String.self, forKey: .chassis_number)
            engine_number = try values.decodeIfPresent(String.self, forKey: .engine_number)
        }

    }

    
    struct Soat : Codable {
        let number : String?
        let ensure_id : String?
        let date_expired : String?

        enum CodingKeys: String, CodingKey {

            case number = "number"
            case ensure_id = "ensure_id"
            case date_expired = "date_expired"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            number = try values.decodeIfPresent(String.self, forKey: .number)
            ensure_id = try values.decodeIfPresent(String.self, forKey: .ensure_id)
            date_expired = try values.decodeIfPresent(String.self, forKey: .date_expired)
        }

    }

    
    struct Vehicle : Codable {
        let id : Int?
        let owner : Owner?
        let holder : Holder?
        let driver : Driver?
        let placa : String?
        let carmark : Carmark?
        let carline : Carline?
        let carcolor : Carcolor?
        let cartype : Cartype?
        let model : Int?
        let repowering : Int?
        let fuel : Fuel?
        let carconfig : Carconfig?
        let maximum_weight : Int?
        let empty_weight : Int?
        let load_capacity : Int?
        let status : Int?
        let lonlat : String?
        let front_vehicle : Front_vehicle?
        let picture_panoramic_vehicle : Picture_panoramic_vehicle?
        let rear_vehicle : Rear_vehicle?
        let front_ownership_card : Front_ownership_card?
        let back_ownership_card : Back_ownership_card?
        let photo_tecnomecanica : Photo_tecnomecanica?
        let insurance_poliy : Insurance_poliy?
        let soat_photo : Soat_photo?
        let vehicle_workshop : String?
        let thirdstate_id : Int?
        let thirdstate : Thirdstate?
        let is_owner : Bool?
        let is_own_treatment : Bool?
        let profile : Profile?
        let satellite_provider_id : String?
        let satellite_provider : String?
        let username : String?
        let password : String?
        let created_at : String?
        let updated_at : String?
        let maintenance_manager : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case owner = "owner"
            case holder = "holder"
            case driver = "driver"
            case placa = "placa"
            case carmark = "carmark"
            case carline = "carline"
            case carcolor = "carcolor"
            case cartype = "cartype"
            case model = "model"
            case repowering = "repowering"
            case fuel = "fuel"
            case carconfig = "carconfig"
            case maximum_weight = "maximum_weight"
            case empty_weight = "empty_weight"
            case load_capacity = "load_capacity"
            case status = "status"
            case lonlat = "lonlat"
            case front_vehicle = "front_vehicle"
            case picture_panoramic_vehicle = "picture_panoramic_vehicle"
            case rear_vehicle = "rear_vehicle"
            case front_ownership_card = "front_ownership_card"
            case back_ownership_card = "back_ownership_card"
            case photo_tecnomecanica = "photo_tecnomecanica"
            case insurance_poliy = "insurance_poliy"
            case soat_photo = "soat_photo"
            case vehicle_workshop = "vehicle_workshop"
            case thirdstate_id = "thirdstate_id"
            case thirdstate = "thirdstate"
            case is_owner = "is_owner"
            case is_own_treatment = "is_own_treatment"
            case profile = "profile"
            case satellite_provider_id = "satellite_provider_id"
            case satellite_provider = "satellite_provider"
            case username = "username"
            case password = "password"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case maintenance_manager = "maintenance_manager"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
            holder = try values.decodeIfPresent(Holder.self, forKey: .holder)
            do{
                driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
                
            }catch{
                driver = nil
            }
            placa = try values.decodeIfPresent(String.self, forKey: .placa)
            carmark = try values.decodeIfPresent(Carmark.self, forKey: .carmark)
            carline = try values.decodeIfPresent(Carline.self, forKey: .carline)
            carcolor = try values.decodeIfPresent(Carcolor.self, forKey: .carcolor)
            cartype = try values.decodeIfPresent(Cartype.self, forKey: .cartype)
            model = try values.decodeIfPresent(Int.self, forKey: .model)
            repowering = try values.decodeIfPresent(Int.self, forKey: .repowering)
            fuel = try values.decodeIfPresent(Fuel.self, forKey: .fuel)
            carconfig = try values.decodeIfPresent(Carconfig.self, forKey: .carconfig)
            maximum_weight = try values.decodeIfPresent(Int.self, forKey: .maximum_weight)
            empty_weight = try values.decodeIfPresent(Int.self, forKey: .empty_weight)
            load_capacity = try values.decodeIfPresent(Int.self, forKey: .load_capacity)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            lonlat = try values.decodeIfPresent(String.self, forKey: .lonlat)
            front_vehicle = try values.decodeIfPresent(Front_vehicle.self, forKey: .front_vehicle)
            picture_panoramic_vehicle = try values.decodeIfPresent(Picture_panoramic_vehicle.self, forKey: .picture_panoramic_vehicle)
            rear_vehicle = try values.decodeIfPresent(Rear_vehicle.self, forKey: .rear_vehicle)
            front_ownership_card = try values.decodeIfPresent(Front_ownership_card.self, forKey: .front_ownership_card)
            back_ownership_card = try values.decodeIfPresent(Back_ownership_card.self, forKey: .back_ownership_card)
            photo_tecnomecanica = try values.decodeIfPresent(Photo_tecnomecanica.self, forKey: .photo_tecnomecanica)
            insurance_poliy = try values.decodeIfPresent(Insurance_poliy.self, forKey: .insurance_poliy)
            soat_photo = try values.decodeIfPresent(Soat_photo.self, forKey: .soat_photo)
            
            do{
                vehicle_workshop = try values.decodeIfPresent(String.self, forKey: .vehicle_workshop)
                
            }catch{
                vehicle_workshop = ""
            }
            
            thirdstate_id = try values.decodeIfPresent(Int.self, forKey: .thirdstate_id)
            thirdstate = try values.decodeIfPresent(Thirdstate.self, forKey: .thirdstate)
            is_owner = try values.decodeIfPresent(Bool.self, forKey: .is_owner)
            is_own_treatment = try values.decodeIfPresent(Bool.self, forKey: .is_own_treatment)
            profile = try values.decodeIfPresent(Profile.self, forKey: .profile)
            
            do{
                satellite_provider_id = try values.decodeIfPresent(String.self, forKey: .satellite_provider_id)
                
            }catch{
                satellite_provider_id = ""
            }
            
            do{
                satellite_provider = try values.decodeIfPresent(String.self, forKey: .satellite_provider)
                
            }catch{
                satellite_provider = ""
            }
            username = try values.decodeIfPresent(String.self, forKey: .username)
            password = try values.decodeIfPresent(String.self, forKey: .password)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            
            
            do{
                maintenance_manager = try values.decodeIfPresent(String.self, forKey: .maintenance_manager)
                
            }catch{
                maintenance_manager = ""
            }
            
        }

    }

    
    struct Driver : Codable {
        let id : Int?
        let thirdstates_id : Int?
        let full_name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case thirdstates_id = "thirdstates_id"
            case full_name = "full_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            thirdstates_id = try values.decodeIfPresent(Int.self, forKey: .thirdstates_id)
            full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        }

    }

    
    struct Carconfig : Codable {
        let id : Int?
        let code : String?
        let description : String?
        let capacity : Int?
        let volume_mt : Int?
        let volume_gl : Int?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let countries_id : Int?
        let image : Image?
        let order : Int?
        let equivalent : [Int]?
        let minimum_weight : Int?
        let apply_cartype : Bool?
        let fletxptos_kms : [String]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case code = "code"
            case description = "description"
            case capacity = "capacity"
            case volume_mt = "volume_mt"
            case volume_gl = "volume_gl"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case countries_id = "countries_id"
            case image = "image"
            case order = "order"
            case equivalent = "equivalent"
            case minimum_weight = "minimum_weight"
            case apply_cartype = "apply_cartype"
            case fletxptos_kms = "fletxptos_kms"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            capacity = try values.decodeIfPresent(Int.self, forKey: .capacity)
            volume_mt = try values.decodeIfPresent(Int.self, forKey: .volume_mt)
            volume_gl = try values.decodeIfPresent(Int.self, forKey: .volume_gl)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            countries_id = try values.decodeIfPresent(Int.self, forKey: .countries_id)
            image = try values.decodeIfPresent(Image.self, forKey: .image)
            order = try values.decodeIfPresent(Int.self, forKey: .order)
            equivalent = try values.decodeIfPresent([Int].self, forKey: .equivalent)
            minimum_weight = try values.decodeIfPresent(Int.self, forKey: .minimum_weight)
            apply_cartype = try values.decodeIfPresent(Bool.self, forKey: .apply_cartype)
            fletxptos_kms = try values.decodeIfPresent([String].self, forKey: .fletxptos_kms)
        }

    }

    
    struct Fuel : Codable {
        let id : Int?
        let name : String?
        let value : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value = "value"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }

    
    struct Trailermark : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let code_mint : Int?
        let partner_id : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case code_mint = "code_mint"
            case partner_id = "partner_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            code_mint = try values.decodeIfPresent(Int.self, forKey: .code_mint)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
        }

    }
    
    struct Image : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Carline : Codable {
        let id : Int?
        let name : String?
        let value : String?
        let status : Int?
        let carmarks_id : Int?
        let created_at : String?
        let updated_at : String?
        let partner_id : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value = "value"
            case status = "status"
            case carmarks_id = "carmarks_id"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case partner_id = "partner_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            carmarks_id = try values.decodeIfPresent(Int.self, forKey: .carmarks_id)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
        }

    }

    
    struct Front_vehicle : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Insurance_poliy : Codable {
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

    
    struct Vehicles_unload : Codable {
        let id : Int?
        let document_requests : [String]?
        let loadgenerator_id : Int?
        let negotiatedby_id : Int?
        let negotiatedby : Negotiatedby?
        let modality_id : Int?
        let modality : Modality?
        let loading_date : String?
        let time_load : Int?
        let download_date : String?
        let driver_id : Int?
        let driver : Driver?
        let vehicle_id : Int?
        let time_download : String?
        let time_agreement : String?
        let requeststatus_id : Int?
        let requeststatus : Requeststatus?
        let freight : Int?
        let value_pay_to_driver : String?
        let load_weight : Int?
        let load_units : Int?
        let value_merchandise : String?
        let negotiatedpercentage_id : String?
        let negotiatedpercentage : String?
        let delivered : String?
        let restrictions : String?
        let legality_merchandise : Bool?
        let legality_merchandise_file : Legality_merchandise_file?
        let language : String?
        let verification_code : String?
        let verify : Bool?
        let photo_detail_product : Photo_detail_product?
        let route_image : Route_image?
        let cartype_id : Int?
        let carconfig_id : Int?
        let requested_vehicles : Int?
        let booking_id : Int?
        let auction_time : String?
        let advance_type : Int?
        let advance_value : Int?
        let merchandise_detail : String?
        let another_receives : Bool?
        let name_receives : String?
        let phone_receives : String?
        let comment : String?
        let additional_comments : String?
        let has_a_loading_date : Bool?
        let loading_time_slot : Int?
        let travel_distance : Int?
        let has_auction : Bool?
        let ingresoid_remesa : String?
        let ingresoid_manifest : String?
        let request_type : String?
        let request_type_id : String?
        let address_origin : String?
        let address_destination : String?
        let origin_plant : String?
        let destination_plant : String?
        let is_request_active : Bool?
        let get_payment_trasaction : String?
        let created_at : String?
        let updated_at : String?
        let vehicle : Vehicle?
        let trailer : Trailer?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case document_requests = "document_requests"
            case loadgenerator_id = "loadgenerator_id"
            case negotiatedby_id = "negotiatedby_id"
            case negotiatedby = "negotiatedby"
            case modality_id = "modality_id"
            case modality = "modality"
            case loading_date = "loading_date"
            case time_load = "time_load"
            case download_date = "download_date"
            case driver_id = "driver_id"
            case driver = "driver"
            case vehicle_id = "vehicle_id"
            case time_download = "time_download"
            case time_agreement = "time_agreement"
            case requeststatus_id = "requeststatus_id"
            case requeststatus = "requeststatus"
            case freight = "freight"
            case value_pay_to_driver = "value_pay_to_driver"
            case load_weight = "load_weight"
            case load_units = "load_units"
            case value_merchandise = "value_merchandise"
            case negotiatedpercentage_id = "negotiatedpercentage_id"
            case negotiatedpercentage = "negotiatedpercentage"
            case delivered = "delivered"
            case restrictions = "restrictions"
            case legality_merchandise = "legality_merchandise"
            case legality_merchandise_file = "legality_merchandise_file"
            case language = "language"
            case verification_code = "verification_code"
            case verify = "verify"
            case photo_detail_product = "photo_detail_product"
            case route_image = "route_image"
            case cartype_id = "cartype_id"
            case carconfig_id = "carconfig_id"
            case requested_vehicles = "requested_vehicles"
            case booking_id = "booking_id"
            case auction_time = "auction_time"
            case advance_type = "advance_type"
            case advance_value = "advance_value"
            case merchandise_detail = "merchandise_detail"
            case another_receives = "another_receives"
            case name_receives = "name_receives"
            case phone_receives = "phone_receives"
            case comment = "comment"
            case additional_comments = "additional_comments"
            case has_a_loading_date = "has_a_loading_date"
            case loading_time_slot = "loading_time_slot"
            case travel_distance = "travel_distance"
            case has_auction = "has_auction"
            case ingresoid_remesa = "ingresoid_remesa"
            case ingresoid_manifest = "ingresoid_manifest"
            case request_type = "request_type"
            case request_type_id = "request_type_id"
            case address_origin = "address_origin"
            case address_destination = "address_destination"
            case origin_plant = "origin_plant"
            case destination_plant = "destination_plant"
            case is_request_active = "is_request_active"
            case get_payment_trasaction = "get_payment_trasaction"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case vehicle = "vehicle"
            case trailer = "trailer"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            document_requests = try values.decodeIfPresent([String].self, forKey: .document_requests)
            loadgenerator_id = try values.decodeIfPresent(Int.self, forKey: .loadgenerator_id)
            negotiatedby_id = try values.decodeIfPresent(Int.self, forKey: .negotiatedby_id)
            negotiatedby = try values.decodeIfPresent(Negotiatedby.self, forKey: .negotiatedby)
            modality_id = try values.decodeIfPresent(Int.self, forKey: .modality_id)
            modality = try values.decodeIfPresent(Modality.self, forKey: .modality)
            loading_date = try values.decodeIfPresent(String.self, forKey: .loading_date)
            do{
                time_load = try values.decodeIfPresent(Int.self, forKey: .time_load)
            }catch{
                time_load = 0
            }
            
            do{
                download_date = try values.decodeIfPresent(String.self, forKey: .download_date)
            }catch{
                download_date = ""
            }
            driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
            do{
                driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
                
            }catch{
                driver = nil
            }
            vehicle_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_id)
            time_download = try values.decodeIfPresent(String.self, forKey: .time_download)
            time_agreement = try values.decodeIfPresent(String.self, forKey: .time_agreement)
            requeststatus_id = try values.decodeIfPresent(Int.self, forKey: .requeststatus_id)
            requeststatus = try values.decodeIfPresent(Requeststatus.self, forKey: .requeststatus)
            freight = try values.decodeIfPresent(Int.self, forKey: .freight)
            value_pay_to_driver = try values.decodeIfPresent(String.self, forKey: .value_pay_to_driver)
            load_weight = try values.decodeIfPresent(Int.self, forKey: .load_weight)
            load_units = try values.decodeIfPresent(Int.self, forKey: .load_units)
            value_merchandise = try values.decodeIfPresent(String.self, forKey: .value_merchandise)
            negotiatedpercentage_id = try values.decodeIfPresent(String.self, forKey: .negotiatedpercentage_id)
            negotiatedpercentage = try values.decodeIfPresent(String.self, forKey: .negotiatedpercentage)
            delivered = try values.decodeIfPresent(String.self, forKey: .delivered)
            restrictions = try values.decodeIfPresent(String.self, forKey: .restrictions)
            legality_merchandise = try values.decodeIfPresent(Bool.self, forKey: .legality_merchandise)
            legality_merchandise_file = try values.decodeIfPresent(Legality_merchandise_file.self, forKey: .legality_merchandise_file)
            do{
                language = try values.decodeIfPresent(String.self, forKey: .language)
                
            }catch{
                language = ""
            }
            
            verification_code = try values.decodeIfPresent(String.self, forKey: .verification_code)
            verify = try values.decodeIfPresent(Bool.self, forKey: .verify)
            photo_detail_product = try values.decodeIfPresent(Photo_detail_product.self, forKey: .photo_detail_product)
            route_image = try values.decodeIfPresent(Route_image.self, forKey: .route_image)
            cartype_id = try values.decodeIfPresent(Int.self, forKey: .cartype_id)
            carconfig_id = try values.decodeIfPresent(Int.self, forKey: .carconfig_id)
            requested_vehicles = try values.decodeIfPresent(Int.self, forKey: .requested_vehicles)
            booking_id = try values.decodeIfPresent(Int.self, forKey: .booking_id)
            auction_time = try values.decodeIfPresent(String.self, forKey: .auction_time)
            advance_type = try values.decodeIfPresent(Int.self, forKey: .advance_type)
            advance_value = try values.decodeIfPresent(Int.self, forKey: .advance_value)
            merchandise_detail = try values.decodeIfPresent(String.self, forKey: .merchandise_detail)
            another_receives = try values.decodeIfPresent(Bool.self, forKey: .another_receives)
            name_receives = try values.decodeIfPresent(String.self, forKey: .name_receives)
            phone_receives = try values.decodeIfPresent(String.self, forKey: .phone_receives)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            additional_comments = try values.decodeIfPresent(String.self, forKey: .additional_comments)
            has_a_loading_date = try values.decodeIfPresent(Bool.self, forKey: .has_a_loading_date)
            loading_time_slot = try values.decodeIfPresent(Int.self, forKey: .loading_time_slot)
            travel_distance = try values.decodeIfPresent(Int.self, forKey: .travel_distance)
            has_auction = try values.decodeIfPresent(Bool.self, forKey: .has_auction)
            ingresoid_remesa = try values.decodeIfPresent(String.self, forKey: .ingresoid_remesa)
            ingresoid_manifest = try values.decodeIfPresent(String.self, forKey: .ingresoid_manifest)
            request_type = try values.decodeIfPresent(String.self, forKey: .request_type)
            request_type_id = try values.decodeIfPresent(String.self, forKey: .request_type_id)
            address_origin = try values.decodeIfPresent(String.self, forKey: .address_origin)
            address_destination = try values.decodeIfPresent(String.self, forKey: .address_destination)
            origin_plant = try values.decodeIfPresent(String.self, forKey: .origin_plant)
            destination_plant = try values.decodeIfPresent(String.self, forKey: .destination_plant)
            is_request_active = try values.decodeIfPresent(Bool.self, forKey: .is_request_active)
            get_payment_trasaction = try values.decodeIfPresent(String.self, forKey: .get_payment_trasaction)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            vehicle = try values.decodeIfPresent(Vehicle.self, forKey: .vehicle)
            trailer = try values.decodeIfPresent(Trailer.self, forKey: .trailer)
        }

    }

    
    struct Photo_detail_product : Codable {
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

    
    struct Carmark : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let partner_id : Int?
        let code_mint : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case partner_id = "partner_id"
            case code_mint = "code_mint"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
            code_mint = try values.decodeIfPresent(Int.self, forKey: .code_mint)
        }

    }

    
    struct Picture_panoramic_vehicle : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Holder : Codable {
        let id : Int?
        let thirdstates_id : Int?
        let full_name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case thirdstates_id = "thirdstates_id"
            case full_name = "full_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            thirdstates_id = try values.decodeIfPresent(Int.self, forKey: .thirdstates_id)
            full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        }

    }

    
    struct Owner : Codable {
        let id : Int?
        let thirdstates_id : Int?
        let full_name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case thirdstates_id = "thirdstates_id"
            case full_name = "full_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            thirdstates_id = try values.decodeIfPresent(Int.self, forKey: .thirdstates_id)
            full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        }

    }

    
    struct Thirdstate : Codable {
        let id : Int?
        let name : String?
        let status : String?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }

    
    struct Vehicles_load : Codable {
        let id : Int?
        let document_requests : [String]?
        let loadgenerator_id : Int?
        let negotiatedby_id : Int?
        let negotiatedby : Negotiatedby?
        let modality_id : Int?
        let modality : Modality?
        let loading_date : String?
        let time_load : String?
        let download_date : String?
        let driver_id : Int?
        let driver : Driver?
        let vehicle_id : Int?
        let time_download : String?
        let time_agreement : String?
        let requeststatus_id : Int?
        let requeststatus : Requeststatus?
        let freight : Int?
        let value_pay_to_driver : String?
        let load_weight : Int?
        let load_units : Int?
        let value_merchandise : String?
        let negotiatedpercentage_id : String?
        let negotiatedpercentage : String?
        let delivered : String?
        let restrictions : String?
        let legality_merchandise : Bool?
        let legality_merchandise_file : Legality_merchandise_file?
        let language : String?
        let verification_code : String?
        let verify : Bool?
        let photo_detail_product : Photo_detail_product?
        let route_image : Route_image?
        let cartype_id : Int?
        let carconfig_id : Int?
        let requested_vehicles : Int?
        let booking_id : Int?
        let auction_time : String?
        let advance_type : Int?
        let advance_value : Int?
        let merchandise_detail : String?
        let another_receives : Bool?
        let name_receives : String?
        let phone_receives : String?
        let comment : String?
        let additional_comments : String?
        let has_a_loading_date : Bool?
        let loading_time_slot : Int?
        let travel_distance : Int?
        let has_auction : Bool?
        let ingresoid_remesa : String?
        let ingresoid_manifest : String?
        let request_type : String?
        let request_type_id : String?
        let address_origin : String?
        let address_destination : String?
        let origin_plant : String?
        let destination_plant : String?
        let is_request_active : Bool?
        let get_payment_trasaction : String?
        let created_at : String?
        let updated_at : String?
        let vehicle : Vehicle?
        let trailer : Trailer?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case document_requests = "document_requests"
            case loadgenerator_id = "loadgenerator_id"
            case negotiatedby_id = "negotiatedby_id"
            case negotiatedby = "negotiatedby"
            case modality_id = "modality_id"
            case modality = "modality"
            case loading_date = "loading_date"
            case time_load = "time_load"
            case download_date = "download_date"
            case driver_id = "driver_id"
            case driver = "driver"
            case vehicle_id = "vehicle_id"
            case time_download = "time_download"
            case time_agreement = "time_agreement"
            case requeststatus_id = "requeststatus_id"
            case requeststatus = "requeststatus"
            case freight = "freight"
            case value_pay_to_driver = "value_pay_to_driver"
            case load_weight = "load_weight"
            case load_units = "load_units"
            case value_merchandise = "value_merchandise"
            case negotiatedpercentage_id = "negotiatedpercentage_id"
            case negotiatedpercentage = "negotiatedpercentage"
            case delivered = "delivered"
            case restrictions = "restrictions"
            case legality_merchandise = "legality_merchandise"
            case legality_merchandise_file = "legality_merchandise_file"
            case language = "language"
            case verification_code = "verification_code"
            case verify = "verify"
            case photo_detail_product = "photo_detail_product"
            case route_image = "route_image"
            case cartype_id = "cartype_id"
            case carconfig_id = "carconfig_id"
            case requested_vehicles = "requested_vehicles"
            case booking_id = "booking_id"
            case auction_time = "auction_time"
            case advance_type = "advance_type"
            case advance_value = "advance_value"
            case merchandise_detail = "merchandise_detail"
            case another_receives = "another_receives"
            case name_receives = "name_receives"
            case phone_receives = "phone_receives"
            case comment = "comment"
            case additional_comments = "additional_comments"
            case has_a_loading_date = "has_a_loading_date"
            case loading_time_slot = "loading_time_slot"
            case travel_distance = "travel_distance"
            case has_auction = "has_auction"
            case ingresoid_remesa = "ingresoid_remesa"
            case ingresoid_manifest = "ingresoid_manifest"
            case request_type = "request_type"
            case request_type_id = "request_type_id"
            case address_origin = "address_origin"
            case address_destination = "address_destination"
            case origin_plant = "origin_plant"
            case destination_plant = "destination_plant"
            case is_request_active = "is_request_active"
            case get_payment_trasaction = "get_payment_trasaction"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case vehicle = "vehicle"
            case trailer = "trailer"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            document_requests = try values.decodeIfPresent([String].self, forKey: .document_requests)
            loadgenerator_id = try values.decodeIfPresent(Int.self, forKey: .loadgenerator_id)
            negotiatedby_id = try values.decodeIfPresent(Int.self, forKey: .negotiatedby_id)
            negotiatedby = try values.decodeIfPresent(Negotiatedby.self, forKey: .negotiatedby)
            modality_id = try values.decodeIfPresent(Int.self, forKey: .modality_id)
            modality = try values.decodeIfPresent(Modality.self, forKey: .modality)
            loading_date = try values.decodeIfPresent(String.self, forKey: .loading_date)
            do{
                time_load = try values.decodeIfPresent(String.self, forKey: .time_load)
                
            }catch{
                time_load = ""
            }
            do{
                download_date = try values.decodeIfPresent(String.self, forKey: .download_date)
                
            }catch{
                download_date = ""
            }
            driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
            do{
                driver = try values.decodeIfPresent(Driver.self, forKey: .driver)
                
            }catch{
                
                driver = nil
            }
            do{
                vehicle_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_id)
                
            }catch{
                
                vehicle_id = 0
            }
            
            do{
                time_download = try values.decodeIfPresent(String.self, forKey: .time_download)
            }catch{
                time_download = ""
            }
            
            do{
                time_agreement = try values.decodeIfPresent(String.self, forKey: .time_agreement)
            }catch{
                time_agreement = ""
            }
            
            requeststatus_id = try values.decodeIfPresent(Int.self, forKey: .requeststatus_id)
            requeststatus = try values.decodeIfPresent(Requeststatus.self, forKey: .requeststatus)
            freight = try values.decodeIfPresent(Int.self, forKey: .freight)
            value_pay_to_driver = try values.decodeIfPresent(String.self, forKey: .value_pay_to_driver)
            load_weight = try values.decodeIfPresent(Int.self, forKey: .load_weight)
            load_units = try values.decodeIfPresent(Int.self, forKey: .load_units)
            do{
                value_merchandise = try values.decodeIfPresent(String.self, forKey: .value_merchandise)
                
            }catch{
                value_merchandise = ""
            }
            do{
                negotiatedpercentage_id = try values.decodeIfPresent(String.self, forKey: .negotiatedpercentage_id)
                
            }catch{
                negotiatedpercentage_id = ""
            }
            do{
                negotiatedpercentage = try values.decodeIfPresent(String.self, forKey: .negotiatedpercentage)
                
            }catch{
                negotiatedpercentage = ""
            }
            do{
                delivered = try values.decodeIfPresent(String.self, forKey: .delivered)
                
            }catch{
                delivered = ""
            }
            
            restrictions = try values.decodeIfPresent(String.self, forKey: .restrictions)
            legality_merchandise = try values.decodeIfPresent(Bool.self, forKey: .legality_merchandise)
            legality_merchandise_file = try values.decodeIfPresent(Legality_merchandise_file.self, forKey: .legality_merchandise_file)
            language = try values.decodeIfPresent(String.self, forKey: .language)
            verification_code = try values.decodeIfPresent(String.self, forKey: .verification_code)
            verify = try values.decodeIfPresent(Bool.self, forKey: .verify)
            photo_detail_product = try values.decodeIfPresent(Photo_detail_product.self, forKey: .photo_detail_product)
            route_image = try values.decodeIfPresent(Route_image.self, forKey: .route_image)
            cartype_id = try values.decodeIfPresent(Int.self, forKey: .cartype_id)
            carconfig_id = try values.decodeIfPresent(Int.self, forKey: .carconfig_id)
            requested_vehicles = try values.decodeIfPresent(Int.self, forKey: .requested_vehicles)
            booking_id = try values.decodeIfPresent(Int.self, forKey: .booking_id)
            auction_time = try values.decodeIfPresent(String.self, forKey: .auction_time)
            advance_type = try values.decodeIfPresent(Int.self, forKey: .advance_type)
            advance_value = try values.decodeIfPresent(Int.self, forKey: .advance_value)
            do{
                merchandise_detail = try values.decodeIfPresent(String.self, forKey: .merchandise_detail)
            }catch{
                merchandise_detail = ""
            }
            
            another_receives = try values.decodeIfPresent(Bool.self, forKey: .another_receives)
            
            do{
                name_receives = try values.decodeIfPresent(String.self, forKey: .name_receives)
                
            }catch{
                name_receives = ""
            }
            
            do{
                phone_receives = try values.decodeIfPresent(String.self, forKey: .phone_receives)
                
            }catch{
                phone_receives = ""
            }
            
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            
            do{
                additional_comments = try values.decodeIfPresent(String.self, forKey: .additional_comments)
                
            }catch{
                additional_comments = ""
            }
            
            has_a_loading_date = try values.decodeIfPresent(Bool.self, forKey: .has_a_loading_date)
            loading_time_slot = try values.decodeIfPresent(Int.self, forKey: .loading_time_slot)
            travel_distance = try values.decodeIfPresent(Int.self, forKey: .travel_distance)
            has_auction = try values.decodeIfPresent(Bool.self, forKey: .has_auction)
            
            do{
                ingresoid_remesa = try values.decodeIfPresent(String.self, forKey: .ingresoid_remesa)
                
            }catch{
                ingresoid_remesa = ""
            }
            
            do{
                ingresoid_manifest = try values.decodeIfPresent(String.self, forKey: .ingresoid_manifest)
                
            }catch{
                ingresoid_manifest = ""
            }
            
            do{
                request_type = try values.decodeIfPresent(String.self, forKey: .request_type)
                
            }catch{
                request_type = ""
            }
            
            do{
                request_type_id = try values.decodeIfPresent(String.self, forKey: .request_type_id)
                
            }catch{
                request_type_id = ""
            }
            
            address_origin = try values.decodeIfPresent(String.self, forKey: .address_origin)
            address_destination = try values.decodeIfPresent(String.self, forKey: .address_destination)
            origin_plant = try values.decodeIfPresent(String.self, forKey: .origin_plant)
            destination_plant = try values.decodeIfPresent(String.self, forKey: .destination_plant)
            is_request_active = try values.decodeIfPresent(Bool.self, forKey: .is_request_active)
            
            do{
                get_payment_trasaction = try values.decodeIfPresent(String.self, forKey: .get_payment_trasaction)
                
            }catch{
                get_payment_trasaction = ""
            }
            
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            vehicle = try values.decodeIfPresent(Vehicle.self, forKey: .vehicle)
            trailer = try values.decodeIfPresent(Trailer.self, forKey: .trailer)
        }

    }

    
    struct Rear_vehicle : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }


    
    struct Back_ownership_card : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Cartype : Codable {
        let id : Int?
        let name : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let kind : String?
        let code_mint : Int?
        let partner_id : Int?
        let equivalent : [Int]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case kind = "kind"
            case code_mint = "code_mint"
            case partner_id = "partner_id"
            case equivalent = "equivalent"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            kind = try values.decodeIfPresent(String.self, forKey: .kind)
            code_mint = try values.decodeIfPresent(Int.self, forKey: .code_mint)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
            equivalent = try values.decodeIfPresent([Int].self, forKey: .equivalent)
        }

    }

    
    
    struct Tecnomecanica : Codable {
        let number : String?
        let date_expired : String?

        enum CodingKeys: String, CodingKey {

            case number = "number"
            case date_expired = "date_expired"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            number = try values.decodeIfPresent(String.self, forKey: .number)
            date_expired = try values.decodeIfPresent(String.self, forKey: .date_expired)
        }

    }

    
    struct Front_ownership_card : Codable {
        let url : String?

        enum CodingKeys: String, CodingKey {

            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try values.decodeIfPresent(String.self, forKey: .url)
        }

    }

    
    struct Trailer : Codable {
        let id : Int?
        let placa : String?
        let model : Int?
        let maximum_weight : Int?
        let empty_weight : String?
        let picture : Picture?
        let front_card : Front_card?
        let back_card : Back_card?
        let trailermark : Trailermark?
        let trailermark_id : Int?
        let carcolor_id : Int?
        let vehicle_id : Int?
        let owner_id : Int?
        let holder_id : Int?
        let num_axes : String?
        let cartype_id : Int?
        let cartype : Cartype?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case placa = "placa"
            case model = "model"
            case maximum_weight = "maximum_weight"
            case empty_weight = "empty_weight"
            case picture = "picture"
            case front_card = "front_card"
            case back_card = "back_card"
            case trailermark = "trailermark"
            case trailermark_id = "trailermark_id"
            case carcolor_id = "carcolor_id"
            case vehicle_id = "vehicle_id"
            case owner_id = "owner_id"
            case holder_id = "holder_id"
            case num_axes = "num_axes"
            case cartype_id = "cartype_id"
            case cartype = "cartype"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            placa = try values.decodeIfPresent(String.self, forKey: .placa)
            model = try values.decodeIfPresent(Int.self, forKey: .model)
            maximum_weight = try values.decodeIfPresent(Int.self, forKey: .maximum_weight)
            empty_weight = try values.decodeIfPresent(String.self, forKey: .empty_weight)
            picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
            front_card = try values.decodeIfPresent(Front_card.self, forKey: .front_card)
            back_card = try values.decodeIfPresent(Back_card.self, forKey: .back_card)
            trailermark = try values.decodeIfPresent(Trailermark.self, forKey: .trailermark)
            trailermark_id = try values.decodeIfPresent(Int.self, forKey: .trailermark_id)
            carcolor_id = try values.decodeIfPresent(Int.self, forKey: .carcolor_id)
            vehicle_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_id)
            owner_id = try values.decodeIfPresent(Int.self, forKey: .owner_id)
            holder_id = try values.decodeIfPresent(Int.self, forKey: .holder_id)
            do{
              num_axes = try values.decodeIfPresent(String.self, forKey: .num_axes)
              }catch{
                do{
            num_axes = "\(String(describing: try values.decodeIfPresent(Int.self, forKey: .num_axes)))"
                }catch{
               num_axes = ""
              }
             }
            cartype_id = try values.decodeIfPresent(Int.self, forKey: .cartype_id)
            cartype = try values.decodeIfPresent(Cartype.self, forKey: .cartype)
        }

    }

    
    struct Carcolor : Codable {
        let id : Int?
        let name : String?
        let value : String?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let partner_id : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value = "value"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case partner_id = "partner_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            
            do{
                value = try values.decodeIfPresent(String.self, forKey: .value)
                
            }catch{
                value = ""
            }
            
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            partner_id = try values.decodeIfPresent(Int.self, forKey: .partner_id)
        }

    }

    
    
}
