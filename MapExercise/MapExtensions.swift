//
//  MapExtensions.swift
//  MapExercise
//
//  Created by KimiaKarbin on 04/01/26.
//

import MapKit


extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
}
extension MKCoordinateRegion{
    static let boston = MKCoordinateRegion(
        center :CLLocationCoordinate2D(latitude: 42.360256, longitude: -71.057279),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    static let northShore = MKCoordinateRegion(
        center :CLLocationCoordinate2D(latitude: 42.547408, longitude: -70.870085),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
}
