//
//  LookAroundService.swift
//  MapExercise
//
//  Created by KimiaKarbin on 12/01/26.
//

import MapKit

class LookAroundService{
    
    func getLookAroundScene(
        for item: MKMapItem,
        completion: @escaping (MKLookAroundScene?) -> Void
    ){
        Task {
            let request = MKLookAroundSceneRequest(mapItem : item)
            let scene = try? await request.scene
            completion(scene)
        }
        
    }
}




