//
//  MapViewModel.swift
//  MapExercise
//
//  Created by KimiaKarbin on 03/01/26.
//

import SwiftUI
import MapKit
import Observation


@MainActor
@Observable final class MapViewModel {
 
     var route: MKRoute?
     var selectedResult: MKMapItem?
     var expectedTravelTime: String?
     var searchResults: [MKMapItem] = []
     var visibleRegion: MKCoordinateRegion?
     var lookAroundScene: MKLookAroundScene?
     var position: MapCameraPosition = .automatic
     var selectedCoordinate: CLLocationCoordinate2D?

     let routeService = RouteService()
    
     func requestRoute(destination: MKMapItem) {
        routeService.requestRoute(destination: destination) { route in
            self.route = route
            self.expectedTravelTime = self.computedTravelTime
        }
     }

    func search(for query: String){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = visibleRegion ?? MKCoordinateRegion(
            center: .parking,
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))

        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }

    func resultSelected(result: MKMapItem) {
        selectedResult = result
        requestRoute(destination: result)
        getLookAroundScene(for: result)
    }
    
    private var computedTravelTime : String?{
        guard let route else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.minute, .hour]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    func getLookAroundScene(for item: MKMapItem){
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(mapItem : item)
            lookAroundScene = try? await request.scene
        }
    }
}
   
