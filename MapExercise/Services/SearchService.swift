//
//  SearchService.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit

class SearchService{
    func search(
        for query: String,
        region: MKCoordinateRegion,
        completion: @escaping ([MKMapItem]) -> Void
    ){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = region
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            completion(response?.mapItems ?? [])
        }
    }
}
