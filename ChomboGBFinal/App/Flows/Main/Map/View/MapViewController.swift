//
//  MapViewController.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 31.01.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreLocationUI


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    private var mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    private let backButton = BackButton()
    private let currentLocationButton = CurrentLocationButton()
    let locationManager = CLLocationManager()
    
    var places: [Places] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackButton()
        setCurrentLocationButton()
       
        setMapConstraints()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.delegate = self
        mapView.register(PlacesMarkersView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        
        
       
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
        mapView.showsUserLocation = true
    }
    func setBackButton(){
        mapView.addSubview(backButton.backButton)
        backButton.viewDidLayoutSubviews()
        backButton.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    func setCurrentLocationButton(){
        mapView.addSubview(currentLocationButton.currentLocationButton)
        currentLocationButton.viewDidLayoutSubviews()
        currentLocationButton.currentLocationButton.addTarget(self, action: #selector(currentLocationButtonTapped), for: .touchUpInside)
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

@objc extension MapViewController {
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func currentLocationButtonTapped() {
        print("Button navigation tapped")
    }
}

extension MapViewController {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Authorized Always")
        case .authorizedWhenInUse:
            print("Authorized When in Use")
        @unknown default:
            print("Unknown status")
            
        }
    }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let places = view.annotation as? Places else {
                return
            }
            // выбар транспорта для построения маршрута
            let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
            
            places.mapItem?.openInMaps(launchOptions: launchOption)
    }
}
