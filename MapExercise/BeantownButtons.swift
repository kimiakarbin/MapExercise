//
//  MapViewModel.swift
//  MapExercise
//
//  Created by KimiaKarbin on 02/01/26.
//

import SwiftUI
import MapKit

struct BeanTownButtons: View {
   
    let onSearchSelected: (String) -> Void
    let onPosition: (MapCameraPosition) -> Void
    
    var body: some View{
        HStack{
            Button{
                onSearchSelected ( "playground")}label: {
                    Label("playground", systemImage: "figure.child.holdinghands")
                }
                .buttonStyle(.borderedProminent)
            Button{
                onSearchSelected("beach")
            }label: {
                Label("beach", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            
        Button{
            onPosition(.region(.boston))
        } label: {
            Label("Boston", systemImage: "building.2")
        }
        .buttonStyle(.bordered)
        Button{
            onPosition(.region(.northShore))
            } label: {
                Label("North Shore", systemImage: "water.waves")
            }
            .buttonStyle(.bordered)
            }
        .labelStyle(.iconOnly)
        }
    
    

    
    
    
    
    }
    

