//
//  MapActionButtonsView.swift
//  MapExercise
//
//  Created by KimiaKarbin on 02/01/26.
//

import SwiftUI
import MapKit



struct MapActionButtonsView : View {
   
    let onSearchSelected: (String) -> Void
    let onPosition: (MapCameraPosition) -> Void
    
    var body: some View {
        HStack {
            Button {
                onSearchSelected ("park")
            } label: {
                    Label("park.city", systemImage: "tree")
                }
                .buttonStyle(.borderedProminent)
            
            Button {
                onSearchSelected("taxi_stand")
            } label: {
                Label("taxi.stand", systemImage: "car.rear")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                onPosition(.region(.turin))
            } label: {
                Label("city.turin", systemImage: "house")
            }
            .buttonStyle(.bordered)
            
            Button {
                onPosition(.region(.milan))
            } label: {
                Label("city.milan", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
            
            
            }
        .labelStyle(.iconOnly)
        }
    }
    

