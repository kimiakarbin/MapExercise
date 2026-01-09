//
//  ParkingAnnotationView.swift
//  MapExercise
//
//  Created by KimiaKarbin on 09/01/26.
//

import SwiftUI
import MapKit

enum ParkingAnnotation {

    static func content(
        coordinate: CLLocationCoordinate2D
    ) -> some MapContent {

        
        Annotation(
            "Parking",
            coordinate: .parking
        ) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.background)
                
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.secondary, lineWidth: 5)
                
                Image(systemName: "car")
                    .padding(5)
            }
        }
        .annotationSubtitles(.hidden)
        .annotationTitles(.hidden)
        
        
    }
}

      
