//
//  MapViewModel.swift
//  MapExercise
//
//  Created by KimiaKarbin on 03/01/26.
//

import SwiftUI
import MapKit
import Observation
import CoreLocation


@MainActor
@Observable class MapViewModel {
 
     var route: MKRoute?
     var userLocation: CLLocation?
     var selectedResult: MKMapItem?
     var expectedTravelTime: String?
     var searchResults: [MKMapItem] = []
     var visibleRegion: MKCoordinateRegion?
     var lookAroundScene: MKLookAroundScene?
     var position: MapCameraPosition = .automatic
     var selectedCoordinate: CLLocationCoordinate2D?
     var locationAuthorizationStatus: CLAuthorizationStatus?
    


     let routeService = RouteService()
    
     func requestRoute(destination: MKMapItem) {
        routeService.requestRoute(destination: destination) { route in
            self.route = route
            self.expectedTravelTime = self.computedTravelTime
        }
     }
    
    
    
    let searchService = SearchService()
    
    func search(for query: String) {
        let region = visibleRegion ?? MKCoordinateRegion(
            center: .parking,
            span: MKCoordinateSpan(
                latitudeDelta: 0.0125,
                longitudeDelta: 0.0125
            )
        )
        searchService.search(for: query, region: region) { results in
            self.searchResults = results
        }
    }

    
    let lookAroundService = LookAroundService()
    
    func getLookAroundScene(for item: MKMapItem){
        lookAroundService.getLookAroundScene(for: item){scene in
            self.lookAroundScene = scene
        }
    }
    
    
    
    func resultSelected(result: MKMapItem) {
        selectedResult = result
        requestRoute(destination: result)
        getLookAroundScene(for: result)
    }
    
    
   var computedTravelTime : String?{
        guard let route else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.minute, .hour]
        return formatter.string(from: route.expectedTravelTime)
    }

}
   
