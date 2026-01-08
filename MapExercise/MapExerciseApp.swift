//
//  MapExerciseApp.swift
//  MapExercise
//
//  Created by KimiaKarbin on 02/01/26.
//

import SwiftUI


@main
struct MapExerciseApp: App {
    let viewModel = MapViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
