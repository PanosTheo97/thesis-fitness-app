//
//  CustomAnnotation.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 5/8/23.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let coordinateType: CoordinateType
    
    init(coordinateType: CoordinateType, coordinate: CLLocationCoordinate2D) {
        self.coordinateType = coordinateType
        self.title = coordinateType == .start ? "ActivitySession_annotation_start".getLocalized() : "ActivitySession_annotation_finish".getLocalized()
        self.subtitle = coordinateType == .start ? "ActivitySession_annotation_start_description".getLocalized() : "ActivitySession_annotation_finish_description".getLocalized()
        self.coordinate = coordinate
    }
}

enum CoordinateType {
    case start
    case end
}
