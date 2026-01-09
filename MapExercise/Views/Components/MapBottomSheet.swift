//
//  MapBottomSheet.swift
//  MapExercise
//
//  Created by KimiaKarbin on 09/01/26.
//
import SwiftUI
import MapKit

struct MapBottomSheet: View {

    let selectedResult: MKMapItem?
    let expectedTravelTime: String?
    let lookAroundScene: MKLookAroundScene?

    let onSearch: (String) -> Void
    let onPositionChange: (MapCameraPosition) -> Void

    var body: some View {
        HStack {
            Spacer()

            VStack(spacing: 0) {

                if let result = selectedResult {
                    ItemInfoView(
                        name: result.name ?? "Unknown",
                        travelTimeText: expectedTravelTime,
                        lookAroundScene: lookAroundScene
                    )
                    .frame(height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.top, .horizontal])
                }

                MapActionButtonsView  (
                    onSearchSelected: onSearch,
                    onPosition: onPositionChange
                    
//                    MapActionButtonsView  (
//                        onSearchSelected: { query in search(for: query)},
//                        onPosition: { region in position = region }
//                    )
//                    .padd
                )
                .padding(.top)
            }

            Spacer()
        }
        .background(.thinMaterial)
    }
}
    
