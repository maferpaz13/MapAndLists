//
//  DetalleServModel.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import Foundation

class DetalleServModel {
    
    struct DetalleServData : Codable {
        let success : Bool?
        let message : String?
        let data : Data?
        let full : Full?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case data = "data"
            case full = "full"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent(Data.self, forKey: .data)
            full = try values.decodeIfPresent(Full.self, forKey: .full)
        }

    }

    
    struct Data : Codable {
        let delay_driver : String?
        let arrival_load : String?
        let start_load : String?
        let end_load : String?
        let time_load : String?
        let time_wait_load : String?
        let tiempo_atencion_cargue : String?
        let arrival_unload : String?
        let start_unload : String?
        let end_unload : String?
        let time_unload : String?
        let time_wait_unload : String?
        let tiempo_atencion_descargue : String?
        let finish_service : String?
        let transport_company_id : Int?
        let loading_order : String?
        let timesheet : String?
        let manifest : String?

        enum CodingKeys: String, CodingKey {

            case delay_driver = "delay_driver"
            case arrival_load = "arrival_load"
            case start_load = "start_load"
            case end_load = "end_load"
            case time_load = "time_load"
            case time_wait_load = "time_wait_load"
            case tiempo_atencion_cargue = "tiempo_atencion_cargue"
            case arrival_unload = "arrival_unload"
            case start_unload = "start_unload"
            case end_unload = "end_unload"
            case time_unload = "time_unload"
            case time_wait_unload = "time_wait_unload"
            case tiempo_atencion_descargue = "tiempo_atencion_descargue"
            case finish_service = "finish_service"
            case transport_company_id = "transport_company_id"
            case loading_order = "loading_order"
            case timesheet = "timesheet"
            case manifest = "manifest"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            delay_driver = try values.decodeIfPresent(String.self, forKey: .delay_driver)
            arrival_load = try values.decodeIfPresent(String.self, forKey: .arrival_load)
            start_load = try values.decodeIfPresent(String.self, forKey: .start_load)
            end_load = try values.decodeIfPresent(String.self, forKey: .end_load)
            time_load = try values.decodeIfPresent(String.self, forKey: .time_load)
            time_wait_load = try values.decodeIfPresent(String.self, forKey: .time_wait_load)
            tiempo_atencion_cargue = try values.decodeIfPresent(String.self, forKey: .tiempo_atencion_cargue)
            arrival_unload = try values.decodeIfPresent(String.self, forKey: .arrival_unload)
            start_unload = try values.decodeIfPresent(String.self, forKey: .start_unload)
            end_unload = try values.decodeIfPresent(String.self, forKey: .end_unload)
            time_unload = try values.decodeIfPresent(String.self, forKey: .time_unload)
            time_wait_unload = try values.decodeIfPresent(String.self, forKey: .time_wait_unload)
            tiempo_atencion_descargue = try values.decodeIfPresent(String.self, forKey: .tiempo_atencion_descargue)
            finish_service = try values.decodeIfPresent(String.self, forKey: .finish_service)
            transport_company_id = try values.decodeIfPresent(Int.self, forKey: .transport_company_id)
            loading_order = try values.decodeIfPresent(String.self, forKey: .loading_order)
            timesheet = try values.decodeIfPresent(String.self, forKey: .timesheet)
            manifest = try values.decodeIfPresent(String.self, forKey: .manifest)
        }

    }

    
    struct Route_image : Codable {
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

    
    struct Photo_tecnomecanica : Codable {
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
            do{
                url = try values.decodeIfPresent(String.self, forKey: .url)
                
            }catch{
                url = ""
            }
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

    
    struct Request_addresses : Codable {
        let id : Int?
        let request_id : Int?
        let address_id : Int?
        let load_address : Bool?
        let unload_address : Bool?
        let created_at : String?
        let updated_at : String?
        let arrival : Bool?
        let is_first : Bool?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case request_id = "request_id"
            case address_id = "address_id"
            case load_address = "load_address"
            case unload_address = "unload_address"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case arrival = "arrival"
            case is_first = "is_first"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            request_id = try values.decodeIfPresent(Int.self, forKey: .request_id)
            address_id = try values.decodeIfPresent(Int.self, forKey: .address_id)
            load_address = try values.decodeIfPresent(Bool.self, forKey: .load_address)
            unload_address = try values.decodeIfPresent(Bool.self, forKey: .unload_address)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            arrival = try values.decodeIfPresent(Bool.self, forKey: .arrival)
            is_first = try values.decodeIfPresent(Bool.self, forKey: .is_first)
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
        let owner_id : Int?
        let holder_id : Int?
        let driver_id : Int?
        let placa : String?
        let carmark_id : Int?
        let carline_id : Int?
        let carcolor_id : Int?
        let cartype_id : Int?
        let model : Int?
        let repowering : Int?
        let fuel_id : Int?
        let carconfig_id : Int?
        let maximum_weight : Int?
        let empty_weight : Int?
        let load_capacity : Int?
        let status : Int?
        let created_at : String?
        let updated_at : String?
        let lonlat : String?
        let front_vehicle : Front_vehicle?
        let rear_vehicle : Rear_vehicle?
        let soat_photo : Soat_photo?
        let front_ownership_card : Front_ownership_card?
        let back_ownership_card : Back_ownership_card?
        let photo_tecnomecanica : Photo_tecnomecanica?
        let insurance_poliy : Insurance_poliy?
        let thirdstate_id : Int?
        let picture_panoramic_vehicle : Picture_panoramic_vehicle?
        let is_owner : Bool?
        let profile : Profile?
        let rotation : Double?
        let ingreso_id_mint : String?
        let error_mint : String?
        let bigcustomer_id : Int?
        let satellite_provider_id : String?
        let username : String?
        let password : String?
        let car_owner : String?
        let last_location_update : String?
        let photo_substance : String?
        let is_affiliate : Int?
        let referredby_id : String?
        let gps_id : String?
        let speed : String?
        let is_test : Bool?
        let exclusive_fleet_spot : Bool?
        let vehicular_group_id : String?
        let kms : Int?
        let workshop_status : String?
        let transport_company_id : String?
        let maintenance_manager : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case owner_id = "owner_id"
            case holder_id = "holder_id"
            case driver_id = "driver_id"
            case placa = "placa"
            case carmark_id = "carmark_id"
            case carline_id = "carline_id"
            case carcolor_id = "carcolor_id"
            case cartype_id = "cartype_id"
            case model = "model"
            case repowering = "repowering"
            case fuel_id = "fuel_id"
            case carconfig_id = "carconfig_id"
            case maximum_weight = "maximum_weight"
            case empty_weight = "empty_weight"
            case load_capacity = "load_capacity"
            case status = "status"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case lonlat = "lonlat"
            case front_vehicle = "front_vehicle"
            case rear_vehicle = "rear_vehicle"
            case soat_photo = "soat_photo"
            case front_ownership_card = "front_ownership_card"
            case back_ownership_card = "back_ownership_card"
            case photo_tecnomecanica = "photo_tecnomecanica"
            case insurance_poliy = "insurance_poliy"
            case thirdstate_id = "thirdstate_id"
            case picture_panoramic_vehicle = "picture_panoramic_vehicle"
            case is_owner = "is_owner"
            case profile = "profile"
            case rotation = "rotation"
            case ingreso_id_mint = "ingreso_id_mint"
            case error_mint = "error_mint"
            case bigcustomer_id = "bigcustomer_id"
            case satellite_provider_id = "satellite_provider_id"
            case username = "username"
            case password = "password"
            case car_owner = "car_owner"
            case last_location_update = "last_location_update"
            case photo_substance = "photo_substance"
            case is_affiliate = "is_affiliate"
            case referredby_id = "referredby_id"
            case gps_id = "gps_id"
            case speed = "speed"
            case is_test = "is_test"
            case exclusive_fleet_spot = "exclusive_fleet_spot"
            case vehicular_group_id = "vehicular_group_id"
            case kms = "kms"
            case workshop_status = "workshop_status"
            case transport_company_id = "transport_company_id"
            case maintenance_manager = "maintenance_manager"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            owner_id = try values.decodeIfPresent(Int.self, forKey: .owner_id)
            holder_id = try values.decodeIfPresent(Int.self, forKey: .holder_id)
            driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
            placa = try values.decodeIfPresent(String.self, forKey: .placa)
            carmark_id = try values.decodeIfPresent(Int.self, forKey: .carmark_id)
            carline_id = try values.decodeIfPresent(Int.self, forKey: .carline_id)
            carcolor_id = try values.decodeIfPresent(Int.self, forKey: .carcolor_id)
            cartype_id = try values.decodeIfPresent(Int.self, forKey: .cartype_id)
            model = try values.decodeIfPresent(Int.self, forKey: .model)
            repowering = try values.decodeIfPresent(Int.self, forKey: .repowering)
            fuel_id = try values.decodeIfPresent(Int.self, forKey: .fuel_id)
            carconfig_id = try values.decodeIfPresent(Int.self, forKey: .carconfig_id)
            maximum_weight = try values.decodeIfPresent(Int.self, forKey: .maximum_weight)
            empty_weight = try values.decodeIfPresent(Int.self, forKey: .empty_weight)
            load_capacity = try values.decodeIfPresent(Int.self, forKey: .load_capacity)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            lonlat = try values.decodeIfPresent(String.self, forKey: .lonlat)
            front_vehicle = try values.decodeIfPresent(Front_vehicle.self, forKey: .front_vehicle)
            rear_vehicle = try values.decodeIfPresent(Rear_vehicle.self, forKey: .rear_vehicle)
            soat_photo = try values.decodeIfPresent(Soat_photo.self, forKey: .soat_photo)
            front_ownership_card = try values.decodeIfPresent(Front_ownership_card.self, forKey: .front_ownership_card)
            back_ownership_card = try values.decodeIfPresent(Back_ownership_card.self, forKey: .back_ownership_card)
            photo_tecnomecanica = try values.decodeIfPresent(Photo_tecnomecanica.self, forKey: .photo_tecnomecanica)
                insurance_poliy = try values.decodeIfPresent(Insurance_poliy.self, forKey: .insurance_poliy)
            thirdstate_id = try values.decodeIfPresent(Int.self, forKey: .thirdstate_id)
            picture_panoramic_vehicle = try values.decodeIfPresent(Picture_panoramic_vehicle.self, forKey: .picture_panoramic_vehicle)
            is_owner = try values.decodeIfPresent(Bool.self, forKey: .is_owner)
            profile = try values.decodeIfPresent(Profile.self, forKey: .profile)
            rotation = try values.decodeIfPresent(Double.self, forKey: .rotation)
            
            do{
                
                ingreso_id_mint = try values.decodeIfPresent(String.self, forKey: .ingreso_id_mint)
            }catch{
                ingreso_id_mint = ""
            }
            
            do{
                error_mint = try values.decodeIfPresent(String.self, forKey: .error_mint)
            }catch{
                error_mint = ""
            }
            
            bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
            
            
            do{
                
                satellite_provider_id = try values.decodeIfPresent(String.self, forKey: .satellite_provider_id)
            }catch{
                satellite_provider_id = ""
            }
            username = try values.decodeIfPresent(String.self, forKey: .username)
            password = try values.decodeIfPresent(String.self, forKey: .password)
                       
            do{
                car_owner = try values.decodeIfPresent(String.self, forKey: .car_owner)
            }catch{
                car_owner = ""
            }
            
            last_location_update = try values.decodeIfPresent(String.self, forKey: .last_location_update)
            
            do{
                photo_substance = try values.decodeIfPresent(String.self, forKey: .photo_substance)
            }catch{
                photo_substance = ""
            }
            is_affiliate = try values.decodeIfPresent(Int.self, forKey: .is_affiliate)
            
            do{
                referredby_id = try values.decodeIfPresent(String.self, forKey: .referredby_id)
            }catch{
                referredby_id = ""
            }
            
            do{
                gps_id = try values.decodeIfPresent(String.self, forKey: .gps_id)
            }catch{
                gps_id = ""
            }
            
            speed = try values.decodeIfPresent(String.self, forKey: .speed)
            is_test = try values.decodeIfPresent(Bool.self, forKey: .is_test)
            exclusive_fleet_spot = try values.decodeIfPresent(Bool.self, forKey: .exclusive_fleet_spot)
            
            do{
                vehicular_group_id = try values.decodeIfPresent(String.self, forKey: .vehicular_group_id)
            }catch{
                vehicular_group_id = ""
            }
            
            kms = try values.decodeIfPresent(Int.self, forKey: .kms)
            
            do{
                workshop_status = try values.decodeIfPresent(String.self, forKey: .workshop_status)
            }catch{
                workshop_status = ""
            }
            
            do{
                transport_company_id = try values.decodeIfPresent(String.self, forKey: .transport_company_id)
            }catch{
                transport_company_id = ""
            }
            do{
                maintenance_manager = try values.decodeIfPresent(String.self, forKey: .maintenance_manager)
            }catch{
                maintenance_manager = ""
            }
        }

    }

    
    struct Full : Codable {
        let id : Int?
        let loadgenerator_id : Int?
        let negotiatedby_id : Int?
        let negotiatedby : Negotiatedby?
        let modality_id : Int?
        let modality : Modality?
        let loading_date : String?
        let time_load : String?
        let download_date : String?
        let driver_id : Int?
        let driver : String?
        let vehicle_id : Int?
        let vehicle : Vehicle?
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
        let mtrs_to_destiny : Int?
        let seconds_to_destiny : Int?
        let estimated_timed_arrival : String?
        let estimate_price_spot : String?
        let address_origin : String?
        let address_destination : String?
        let origin_plant : String?
        let destination_plant : String?
        let check_inspection_form : Bool?
        let max_value_advance : Int?
        let max_value_preadvance : Int?
        let available_preadvance : Int?
        let available_advance : Int?
        let get_advance : String?
        let get_preadvance : String?
        let get_secondadvance : String?
        let is_travel_displacement : Bool?
        let value_to_pay_displacement : String?
        let is_request_active : Bool?
        let is_round_request : Bool?
        let created_at : String?
        let updated_at : String?
        let cartype : Cartype?
        let estimate_date_download : String?
        let request_addresses : [Request_addresses]?
        let carconfig : String?
        let code : String?
        let owner : Owner?
        let carmark : Carmark?
        let carcolor : Carcolor?
        let trailer_placa : String?
        let trailer_marca : Trailer_marca?
        let trailer_color : Trailer_color?
        let trailer_model : Int?
        let loading_date_alt : String?
        let driver_doc : Int?
        let driver_photo : Driver_photo?
        let vehicle_photo : Vehicle_photo?
        let placa : String?
        let fecha : Int?
        let fecha_subasta : Int?
        let cliente : String?
        let change_destiny : Bool?
        let peso : Double?
        let is_regulated : Bool?
        let minimum_cost : String?
        let maximum_cost : String?
        let is_booking : Bool?
        let flete_max : String?
        let bigcustomer_id : Int?
        let negotiated : String?
        let origen : String?
        let destino : String?
        let packing : String?
        let productcharacter : String?
        let receive_advance : Bool?
        let products : [Products]?
        let distance : String?
        let request_round : String?
        let transport_company_id : Int?
        let url : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
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
            case vehicle = "vehicle"
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
            case mtrs_to_destiny = "mtrs_to_destiny"
            case seconds_to_destiny = "seconds_to_destiny"
            case estimated_timed_arrival = "estimated_timed_arrival"
            case estimate_price_spot = "estimate_price_spot"
            case address_origin = "address_origin"
            case address_destination = "address_destination"
            case origin_plant = "origin_plant"
            case destination_plant = "destination_plant"
            case check_inspection_form = "check_inspection_form"
            case max_value_advance = "max_value_advance"
            case max_value_preadvance = "max_value_preadvance"
            case available_preadvance = "available_preadvance"
            case available_advance = "available_advance"
            case get_advance = "get_advance"
            case get_preadvance = "get_preadvance"
            case get_secondadvance = "get_secondadvance"
            case is_travel_displacement = "is_travel_displacement"
            case value_to_pay_displacement = "value_to_pay_displacement"
            case is_request_active = "is_request_active"
            case is_round_request = "is_round_request"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case cartype = "cartype"
            case estimate_date_download = "estimate_date_download"
            case request_addresses = "request_addresses"
            case carconfig = "carconfig"
            case code = "code"
            case owner = "owner"
            case carmark = "carmark"
            case carcolor = "carcolor"
            case trailer_placa = "trailer_placa"
            case trailer_marca = "trailer_marca"
            case trailer_color = "trailer_color"
            case trailer_model = "trailer_model"
            case loading_date_alt = "loading_date_alt"
            case driver_doc = "driver_doc"
            case driver_photo = "driver_photo"
            case vehicle_photo = "vehicle_photo"
            case placa = "placa"
            case fecha = "fecha"
            case fecha_subasta = "fecha_subasta"
            case cliente = "cliente"
            case change_destiny = "change_destiny"
            case peso = "peso"
            case is_regulated = "is_regulated"
            case minimum_cost = "minimum_cost"
            case maximum_cost = "maximum_cost"
            case is_booking = "is_booking"
            case flete_max = "flete_max"
            case bigcustomer_id = "bigcustomer_id"
            case negotiated = "negotiated"
            case origen = "origen"
            case destino = "destino"
            case packing = "packing"
            case productcharacter = "productcharacter"
            case receive_advance = "receive_advance"
            case products = "products"
            case distance = "distance"
            case request_round = "request_round"
            case transport_company_id = "transport_company_id"
            case url = "url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
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
                
                download_date =  ""
                
            }
            driver_id = try values.decodeIfPresent(Int.self, forKey: .driver_id)
            driver = try values.decodeIfPresent(String.self, forKey: .driver)
            vehicle_id = try values.decodeIfPresent(Int.self, forKey: .vehicle_id)
            vehicle = try values.decodeIfPresent(Vehicle.self, forKey: .vehicle)
            
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
            
            do{
                language = try values.decodeIfPresent(String.self, forKey: .language)
            }catch{
                language = ""
            }
            verification_code = try values.decodeIfPresent(String.self, forKey: .verification_code)
            verify = try values.decodeIfPresent(Bool.self, forKey: .verify)
            
                photo_detail_product = try values.decodeIfPresent(Photo_detail_product.self, forKey: .photo_detail_product)
            
            
            route_image = try values.decodeIfPresent(Route_image.self, forKey: .route_image)
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
            
            mtrs_to_destiny = try values.decodeIfPresent(Int.self, forKey: .mtrs_to_destiny)
            seconds_to_destiny = try values.decodeIfPresent(Int.self, forKey: .seconds_to_destiny)
            estimated_timed_arrival = try values.decodeIfPresent(String.self, forKey: .estimated_timed_arrival)
            estimate_price_spot = try values.decodeIfPresent(String.self, forKey: .estimate_price_spot)
            address_origin = try values.decodeIfPresent(String.self, forKey: .address_origin)
            address_destination = try values.decodeIfPresent(String.self, forKey: .address_destination)
            origin_plant = try values.decodeIfPresent(String.self, forKey: .origin_plant)
            destination_plant = try values.decodeIfPresent(String.self, forKey: .destination_plant)
            check_inspection_form = try values.decodeIfPresent(Bool.self, forKey: .check_inspection_form)
            max_value_advance = try values.decodeIfPresent(Int.self, forKey: .max_value_advance)
            max_value_preadvance = try values.decodeIfPresent(Int.self, forKey: .max_value_preadvance)
            available_preadvance = try values.decodeIfPresent(Int.self, forKey: .available_preadvance)
            available_advance = try values.decodeIfPresent(Int.self, forKey: .available_advance)
            get_advance = try values.decodeIfPresent(String.self, forKey: .get_advance)
            get_preadvance = try values.decodeIfPresent(String.self, forKey: .get_preadvance)
            get_secondadvance = try values.decodeIfPresent(String.self, forKey: .get_secondadvance)
            is_travel_displacement = try values.decodeIfPresent(Bool.self, forKey: .is_travel_displacement)
            value_to_pay_displacement = try values.decodeIfPresent(String.self, forKey: .value_to_pay_displacement)
            is_request_active = try values.decodeIfPresent(Bool.self, forKey: .is_request_active)
            is_round_request = try values.decodeIfPresent(Bool.self, forKey: .is_round_request)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            cartype = try values.decodeIfPresent(Cartype.self, forKey: .cartype)
            estimate_date_download = try values.decodeIfPresent(String.self, forKey: .estimate_date_download)
            request_addresses = try values.decodeIfPresent([Request_addresses].self, forKey: .request_addresses)
            carconfig = try values.decodeIfPresent(String.self, forKey: .carconfig)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
            carmark = try values.decodeIfPresent(Carmark.self, forKey: .carmark)
            carcolor = try values.decodeIfPresent(Carcolor.self, forKey: .carcolor)
            trailer_placa = try values.decodeIfPresent(String.self, forKey: .trailer_placa)
            trailer_marca = try values.decodeIfPresent(Trailer_marca.self, forKey: .trailer_marca)
            trailer_color = try values.decodeIfPresent(Trailer_color.self, forKey: .trailer_color)
            trailer_model = try values.decodeIfPresent(Int.self, forKey: .trailer_model)
            loading_date_alt = try values.decodeIfPresent(String.self, forKey: .loading_date_alt)
            do{
                driver_doc = try values.decodeIfPresent(Int.self, forKey: .driver_doc)
                
            }catch{
                driver_doc = 0
            }
            driver_photo = try values.decodeIfPresent(Driver_photo.self, forKey: .driver_photo)
            vehicle_photo = try values.decodeIfPresent(Vehicle_photo.self, forKey: .vehicle_photo)
            placa = try values.decodeIfPresent(String.self, forKey: .placa)
            fecha = try values.decodeIfPresent(Int.self, forKey: .fecha)
            fecha_subasta = try values.decodeIfPresent(Int.self, forKey: .fecha_subasta)
            cliente = try values.decodeIfPresent(String.self, forKey: .cliente)
            change_destiny = try values.decodeIfPresent(Bool.self, forKey: .change_destiny)
            peso = try values.decodeIfPresent(Double.self, forKey: .peso)
            is_regulated = try values.decodeIfPresent(Bool.self, forKey: .is_regulated)
            minimum_cost = try values.decodeIfPresent(String.self, forKey: .minimum_cost)
            maximum_cost = try values.decodeIfPresent(String.self, forKey: .maximum_cost)
            is_booking = try values.decodeIfPresent(Bool.self, forKey: .is_booking)
            flete_max = try values.decodeIfPresent(String.self, forKey: .flete_max)
            bigcustomer_id = try values.decodeIfPresent(Int.self, forKey: .bigcustomer_id)
            negotiated = try values.decodeIfPresent(String.self, forKey: .negotiated)
            origen = try values.decodeIfPresent(String.self, forKey: .origen)
            destino = try values.decodeIfPresent(String.self, forKey: .destino)
            packing = try values.decodeIfPresent(String.self, forKey: .packing)
            productcharacter = try values.decodeIfPresent(String.self, forKey: .productcharacter)
            receive_advance = try values.decodeIfPresent(Bool.self, forKey: .receive_advance)
            products = try values.decodeIfPresent([Products].self, forKey: .products)
            
            do{
                distance = try values.decodeIfPresent(String.self, forKey: .distance)
                
            }catch{
                distance = ""
            }
            
            do{
                
                request_round = try values.decodeIfPresent(String.self, forKey: .request_round)
                
            }catch{
                request_round = ""
            }
            transport_company_id = try values.decodeIfPresent(Int.self, forKey: .transport_company_id)
            do{
                url = try values.decodeIfPresent(String.self, forKey: .url)
                
            }catch{
                url = ""
            }
        }

    }

    
    struct Trailer_color : Codable {
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

    
    struct Trailer_marca : Codable {
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
    
    struct Front_vehicle : Codable {
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
            do{
                url = try values.decodeIfPresent(String.self, forKey: .url)
                
            }catch{
                url = ""
            }
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
    
    struct Rear_vehicle : Codable {
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
    
    struct Back_ownership_card : Codable {
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
    
    struct Vehicle_photo : Codable {
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

    
    struct Driver_photo : Codable {
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
    
    struct Front_ownership_card : Codable {
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
    
    struct Products : Codable {
        let id : Int?
        let name : String?
        let weight : Double?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case weight = "weight"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            weight = try values.decodeIfPresent(Double.self, forKey: .weight)
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
