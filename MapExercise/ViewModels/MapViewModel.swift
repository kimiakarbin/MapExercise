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
@Observable
class MapViewModel {
 
     var route: MKRoute?
     var userLocation: CLLocation?
     var selectedResult: MKMapItem?
     var expectedTravelTime: String?
     var searchResults: [MKMapItem] = []
     var visibleRegion: MKCoordinateRegion?
     var lookAroundScene: MKLookAroundScene?
     var pins: [Pin] = DataLoader().loadPins()
     var position: MapCameraPosition = .automatic
     var selectedCoordinate: CLLocationCoordinate2D?
     var locationAuthorizationStatus: CLAuthorizationStatus?
    
     let routeService = RouteService()
     let searchService = SearchService()
     let lookAroundService = LookAroundService()
    
    func requestRoute(destination: MKMapItem) async throws {
        
            route = try await routeService.requestRoute(destination: destination)
            expectedTravelTime = computedTravelTime
        }
    
    
    func search(for query: String) async throws {
        
           let region = visibleRegion ?? MKCoordinateRegion(
               center: .parking,
               span: MKCoordinateSpan(
                   latitudeDelta: 0.0125,
                   longitudeDelta: 0.0125
               )
           )
        
           searchResults = try await searchService.search(
               for: query,
               region: region
           )
       }
    
    
    func getLookAroundScene(for item: MKMapItem) async throws {
        
            lookAroundScene = try await lookAroundService.getLookAroundScene(for: item)
        }
    
    
    func resultSelected(result: MKMapItem) async throws {
        
        selectedResult = result
        
        try await requestRoute(destination: result)
        try await getLookAroundScene(for: result)
        
       }
    
    
   var computedTravelTime : String? {
       
        guard let route else { return nil }
       
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.minute, .hour]
       
        return formatter.string(from: route.expectedTravelTime)
    }

}
   
