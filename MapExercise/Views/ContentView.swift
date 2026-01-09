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
    
    @State var viewModel: MapViewModel
    
    var body: some View {
        MapScreen(viewModel: viewModel)
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(viewModel: MapViewModel())
        }
    }

