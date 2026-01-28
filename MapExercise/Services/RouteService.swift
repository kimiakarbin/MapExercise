//
//  Route.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit


class RouteService {
    
    func requestRoute(destination: MKMapItem) async throws -> MKRoute {
        
        let request = MKDirections.Request()
        request.source = MKMapItem/*(placemark:MKPlacemark(coordinate: .parking))*/.forCurrentLocation()
        request.destination = destination
        let directions = MKDirections(request: request)
        let response = try await directions.calculate()
        
        return response.routes.first!
    }
}






