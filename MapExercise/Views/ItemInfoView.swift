//
//  ItemInfoView.swift
//  MapExercise
//
//  Created by KimiaKarbin on 03/01/26.
//
import SwiftUI
import MapKit



struct ItemInfoView: View {
    
    let name: String
    let travelTimeText: String?
    let lookAroundScene: MKLookAroundScene?
    
    var body : some View {
        LookAroundPreview( initialScene: lookAroundScene )
            .overlay( alignment: .bottomTrailing ){
                HStack {
                    Text(name)
                    
                    if let travelTimeText {
                        Text(travelTimeText)
                    }
                }
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(10)
            }
        
    }
}
