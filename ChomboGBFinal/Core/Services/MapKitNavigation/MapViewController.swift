//
//  MapViewController.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 31.01.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMapView()
    }
    //addMapKit
    private func addMapView() {
        let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height ))
        mapView.backgroundColor = .purple
        view.addSubview(mapView)
        
    }
}
