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
    
    
    var mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    let locationManager = CLLocationManager()
    
    var places: [Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapConstraints()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        
        mapView.register(PlacesMarkersView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        //         создание аннотаций
        loadInitialData()
        mapView.addAnnotations(places)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    private func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRage, animated: true)
        
        let regionMaxSize = MKCoordinateRegion(center: coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: regionMaxSize), animated: true)
        
        mapView.setRegion(region, animated: true)
        
        
        //        let pin = MKPointAnnotation()
        //        pin.coordinate = coordinate
        //        pin.subtitle = "current location"
        //
        //        pin.title = "You are Here"
        //        mapView.addAnnotation(pin)
        
    }
    
    func setMapConstraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func loadInitialData() {
        
        guard
            let fileName = Bundle.main.url(forResource: "Places", withExtension: "geojson"),
            let placesData = try? Data(contentsOf: fileName)
        else{
            return
        }
        
        do {
            let features = try MKGeoJSONDecoder()
                .decode(placesData)
                .compactMap{ $0 as? MKGeoJSONFeature}
            
            let validWorks = features.compactMap(Places.init)
            places.append(contentsOf: validWorks)
            
        } catch {
            print ("\(error)")
        }
    }
}

extension MKMapView {
    func centerLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 500) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

extension MapViewController {
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let places = view.annotation as? Places else {
            return
        }
        // выбар транспорта для построения маршрута
        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        
        places.mapItem?.openInMaps(launchOptions: launchOption)
    }
}
