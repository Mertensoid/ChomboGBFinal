//
//  PlacesMarkersView.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 31.01.2023.
//

import Foundation
import MapKit

class PlacesMarkersView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let places = newValue as? Places else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            image = places.image
        }
    }
}
