//
//  MapScreen.swift
//  MapExercise
//
//  Created by KimiaKarbin on 09/01/26.
//

import SwiftUI
import MapKit


struct MapScreen: View {
    @Bindable var viewModel: MapViewModel
    
    var body: some View {
        MapCanvas(
            position: $viewModel.position ,
            selectedResult: $viewModel.selectedResult,
            lookAroundScene: $viewModel.lookAroundScene,
            expectedTravelTime: viewModel.expectedTravelTime,
            ruote: viewModel.route,
            searchResults: viewModel.searchResults,

        )
        MapBottomSheet(
            selectedResult: viewModel.selectedResult,
            expectedTravelTime: viewModel.expectedTravelTime,
            lookAroundScene: viewModel.lookAroundScene,
            onSearch: { query in viewModel.search(for: query) },
            onPositionChange: { region in viewModel.position = region },
           
        )
        
        .onChange(of: viewModel.searchResults) {
            viewModel.position = .automatic
        }
        
        .onChange(of: viewModel.selectedResult) { oldValue, newValue in
            if let newValue = newValue, oldValue != newValue {
                viewModel.requestRoute(destination: newValue)
                viewModel.getLookAroundScene(for: newValue)
            }
        }
        
        .onMapCameraChange {context in
            viewModel.visibleRegion = context.region
        }
        
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }

    }
}
