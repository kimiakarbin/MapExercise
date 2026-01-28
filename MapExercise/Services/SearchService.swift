//
//  SearchService.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit

class SearchService {
    
    func search(
        for query: String,
        region: MKCoordinateRegion,
    ) async throws -> [MKMapItem] {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = region
        
        let search = MKLocalSearch(request: request)
        let response = try await search.start()

        return response.mapItems
    }
}

