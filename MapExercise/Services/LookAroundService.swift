//
//  LookAroundService.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit

class LookAroundService {
    
    func getLookAroundScene( for item: MKMapItem ) async throws -> MKLookAroundScene? {
        
        let request = MKLookAroundSceneRequest(mapItem : item)
        return try await request.scene
    }
}





