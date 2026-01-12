//
//  Route.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit

class RouteService {
    func requestRoute(
        destination: MKMapItem,
        completion: @escaping (MKRoute?) -> Void
    ) {
        let request = MKDirections.Request()
        request.source = MKMapItem/*(placemark:MKPlacemark(coordinate: .parking))*/.forCurrentLocation()
        request.destination = destination
        
      Task {
         let directions = MKDirections(request: request)
         let response = try? await directions.calculate()
         completion(response?.routes.first)
         
        }
    }

    
    
}





