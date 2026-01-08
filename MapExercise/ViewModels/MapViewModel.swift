//
//  MapViewModel.swift
//  MapExercise
//
//  Created by KimiaKarbin on 03/01/26.
//

import SwiftUI
import Combine
import MapKit
@MainActor
final class MapViewModel: ObservableObject {
 
    @Published var route: MKRoute?
    @Published var searchResults: [MKMapItem] = []
    @Published var visibleRegion: MKCoordinateRegion?
    @Published var position: MapCameraPosition = .automatic
    @Published var SelectedResult: MKMapItem?
    @Published var LookAroundScene: MKLookAroundScene?
    @Published var expectedTravelTime: String?
    @Published var selectedCoordinate: CLLocationCoordinate2D?


    func requestRoute(destination: MKMapItem) {
        let request = MKDirections.Request()
        request.source = MKMapItem/*(placemark:MKPlacemark(coordinate: .parking))*/.forCurrentLocation()
        request.destination = destination
        
      Task {
         let directions = MKDirections(request: request)
         let response = try? await directions.calculate()
         route = response?.routes.first
        expectedTravelTime = computedTravelTime
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
        SelectedResult = result
        requestRoute(destination: result)
        getLookAroundScene(for: result)
    }
    
    private var computedTravelTime : String?{
        guard let route else { return nil }
        let Formatter = DateComponentsFormatter()
        Formatter.unitsStyle = .abbreviated
        Formatter.allowedUnits = [.minute, .hour]
        return Formatter.string(from: route.expectedTravelTime)
    }
    
    func getLookAroundScene(for item: MKMapItem){
        LookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(mapItem : item)
            LookAroundScene = try? await request.scene
        }
    }
}
   
