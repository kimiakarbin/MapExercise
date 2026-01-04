//
//  MapExtensions.swift
//  MapExercise
//
//  Created by KimiaKarbin on 04/01/26.
//

import MapKit


extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 45.062861, longitude: 7.678029)
}
extension MKCoordinateRegion{
    static let turin = MKCoordinateRegion(
        center :CLLocationCoordinate2D(latitude: 45.07351, longitude: 7.68148),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    static let milan = MKCoordinateRegion(
        center :CLLocationCoordinate2D(latitude: 45.46718, longitude: 9.18966),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
}
