//
//  Pin.swift
//  MapExercise
//
//  Created by KimiaKarbin on 16/01/26.
//

struct Pin: Codable , Identifiable {
    
    let id: String
    let coordinate: Coordinate
    let title: String
    let subtitle: String?
}
