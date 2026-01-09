//
//  MapCanvas.swift
//  MapExercise
//
//  Created by KimiaKarbin on 09/01/26.
//

import SwiftUI
import MapKit


struct MapCanvas: View {
    
    @Binding var position: MapCameraPosition
    @Binding var selectedResult: MKMapItem?
    @Binding var lookAroundScene: MKLookAroundScene?
    
    let expectedTravelTime: String?
    let ruote: MKRoute?
    let searchResults: [MKMapItem]
    
    var body: some View {
        Map(
            position: $position,
            selection: $selectedResult
        ) {
            ParkingAnnotation.content(coordinate: .parking)
            // Marker("Parking", coordinate: .parking)
            ForEach(
                searchResults,
                id: \.self
            ) {result in
                Marker(item : result)
            }
            .annotationTitles(.hidden)
            
            UserAnnotation()
            
            if let ruote {
                MapPolyline(ruote)
                    .stroke(.blue, lineWidth: 5)
            }
            MapPolyline(coordinates: turinPolygon)
                .stroke(.black, lineWidth: 1)
            
        //            MapPolygon(coordinates: turinPolygon)
        //                .foregroundStyle(.black.opacity(0.2))
        //                .bordered(Color.black.opacity(0.9))
        }
        .mapStyle(.standard (elevation: .realistic))
    }
}
