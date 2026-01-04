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
                onSearchSelected ( "park")}label: {
                    Label("park", systemImage: "tree")
                }
                .buttonStyle(.borderedProminent)
            Button{
                onSearchSelected("taxi stand")
            }label: {
                Label("taxi stand", systemImage: "car.rear")
            }
            .buttonStyle(.borderedProminent)
            
        Button{
            onPosition(.region(.turin))
        } label: {
            Label("Turin", systemImage: "house")
        }
        .buttonStyle(.bordered)
        Button{
            onPosition(.region(.milan))
            } label: {
                Label("Milan", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
            }
        .labelStyle(.iconOnly)
        }
    
    

    
    
    
    
    }
    

