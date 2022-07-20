//
//  EndPoints.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 13/06/22.
//

import Foundation

struct EndPoints {
    static let domain = "http://st.fletx.co:5000/"
}


struct URLPost {
    static let signin = "/users/sign_in.json"
    static let creacionDelServicio = "/commercial/bookings/create_new_booking.json"
}

struct URLGet {
    static let ubicacionDelVehiculo = "/clients/position_drivers_in_ride.json"
    static let alertasDelConductor = "/clients/driver_messages.json"
    static let serviciosSolicitados = "/clients/requests/{BigCostumerID}/getall.json?t=orders"
    static let SeguimientosdeViajes = "/clients/requests/{BigCostumerID}/getall.json"
    static let listaDePlantas = "/clients/plants/{BigCostumerID}/getall.json"
    static let vehCargueDescargue = "/clients/plants/{PlantID}/vehicles_address.json?bigcustomer_id={BigCostumerID}"
    static let historicoDeViajes = "/clients/requests/{BigCostumerID}/getall.json?t=historics"
    static let bookingsBigCostumer = "/commercial/bookings/get_bookings_by_bigcustomer/{BigCostumerID}.json"
    static let detallesServicio = "/requests/request_summary/{RequestID}.json"
    static let negociosBigCostumer = "/commercial/businesses/getbusinessfrombigcustomer/{BigCostumerID}.json"
    static let carConfig = "/system/tables/carconfigs.json"
    static let carTypes = "/system/tables/cartypes.json"
    static let rutaBusiness = "commercial/businessroutes/getbusinessroutesfrombussiness/{BusinessID}.json"
    static let BookingsType = "/commercial/bookings/get_bookings_types.json"
    static let DireccionesNegocio = "/commercial/booking_addresses/get_adresses_new_booking/{BigCostumerID}/{RouteID}/{load}/{unload}.json"
    static let BusinessProducts = "/commercial/businessproducts/getbusinessproductsfrombussiness/{BusinessID}.json"
    static let Emite = "/commercial/bigcustomers/loadgenerators_emite_from_bigcustomers/{BigCostumerID}.json"
    static let Paga = "/commercial/bigcustomers/loadgenerators_paga_from_bigcustomers/{BigCostumerID}.json"
    static let Recibe = "/commercial/bigcustomers/loadgenerators_recibe_from_bigcustomers/{BigCostumerID}.json"
    static let BitacoraDeViaje =
    "/requests/detail_events_requests/{RequestID}.json"
    static let requestBooking = "/commercial/bookings/get_requests_by_booking/{BookingID}.json"
}
