//
//  ContentView.swift
//  MapExercise
//
//  Created by KimiaKarbin on 02/01/26.
//

import SwiftUI
import MapKit
import Observation



struct ContentView: View {
    
    @Bindable var viewModel: MapViewModel

    var body: some View {
        Map(
            position: $viewModel.position,
            selection: $viewModel.selectedResult
        ) {
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
            // Marker("Parking", coordinate: .parking)
            ForEach(
                viewModel.searchResults,
                id: \.self
            ) {result in
                Marker(item : result)
            }
            .annotationTitles(.hidden)
            
            UserAnnotation()
            
            if let route = viewModel.route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }
            
            MapPolyline(coordinates: turinPolygon)
                .stroke(.black, lineWidth: 1)
            
//            MapPolygon(coordinates: turinPolygon)
//                .foregroundStyle(.black.opacity(0.2))
//                .bordered(Color.black.opacity(0.9))
        }
        .mapStyle(.standard (elevation: .realistic))
        .safeAreaInset(edge: .bottom,) {
            
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    if let result = viewModel.selectedResult {
                        ItemInfoView(
                            name: result.name ?? "Unknown",
                            travelTimeText: viewModel.expectedTravelTime,
                            lookAroundScene: viewModel.lookAroundScene
                        )
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    BeanTownButtons(
                        onSearchSelected: { query in viewModel.search(for: query)},
                        onPosition: { region in viewModel.position = region }
                    )
                    .padding(.top)
                }
                Spacer()
            }
            .background(.thinMaterial)
        }
        
        
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
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(viewModel: MapViewModel())
        }
    }

