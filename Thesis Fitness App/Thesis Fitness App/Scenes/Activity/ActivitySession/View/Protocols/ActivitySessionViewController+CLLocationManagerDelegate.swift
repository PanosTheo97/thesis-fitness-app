//
//  ActivitySessionViewController+CLLocationManagerDelegate.swift
//  Thesis Fitness App
//
//  Created by Panagiotis Theodosiadis on 5/8/23.
//

import Foundation
import CoreLocation
import MapKit

extension ActivitySessionViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {
            return
        }
        self.addLocationsToArray(locations)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
            case .notDetermined:
                self.locationManager.requestAlwaysAuthorization()
            case .restricted, .denied:
                self.flowCoordinator?.displayLocationAlert()
                return
            case .authorizedAlways, .authorizedWhenInUse:
                self.locationManager.requestLocation()
            default: ()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .systemBlue
        renderer.lineWidth = 5
        renderer.alpha = 0.5
        
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? CustomAnnotation {
            let id = "pin"
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            view.canShowCallout = true
            view.animatesDrop = true
            view.pinTintColor = annotation.coordinateType == .start ? .green : .red
            view.calloutOffset = CGPoint(x: -8, y: -3)
            
            return view
        }
        return nil
    }
    
    func addLocationsToArray(_ locations: [CLLocation]) {
        for location in locations {
            if !locationsTraversed.contains(location) {
                locationsTraversed.append(location)
            }
        }
        self.updateDistanceTravelled()
    }
    
    func updateDistanceTravelled() {
        var totalDistance = 0.0
        for i in 1..<self.locationsTraversed.count {
            let previousLocation = self.locationsTraversed[i-1]
            let currentLocation = self.locationsTraversed[i]
            totalDistance += currentLocation.distance(from: previousLocation)
        }
        
        if totalDistance == 0.0 {
            self.distanceLabel.text = "-"
        } else {
            let distanceInKm = round(totalDistance) / 1000
            self.distanceLabel.text = String(format: "ActivitySession_kilometers".getLocalized(), distanceInKm)
        }
        self.updatePace(distanceInKm: round(totalDistance) / 1000)
    }
    
    func updatePace(distanceInKm: Double) {
        guard let elapsedTime = self.viewModel?.mainStopwatch.elapsedTime() else {
            self.paceLabel.text = "-"
            return
        }
        let elapsedMinutes = Int(elapsedTime / 60) % 60
        
        let pace = Double(elapsedMinutes) / distanceInKm
        
        if pace > 0 && pace < 120 {
            self.paceLabel.text = String(format: "ActivitySession_pace".getLocalized(), pace)
        } else {
            self.paceLabel.text = "-"
        }
    }
    
    func setupAnnotations() {
        guard let startLocation = self.locationsTraversed.first?.coordinate, let endLocation = self.locationsTraversed.last?.coordinate, self.locationsTraversed.count > 1 else {
            return
        }
        let startAnnotation = CustomAnnotation(coordinateType: .start, coordinate: startLocation)
        let endAnnotation = CustomAnnotation(coordinateType: .end, coordinate: endLocation)
        
        self.mapKitView.addAnnotation(startAnnotation)
        self.mapKitView.addAnnotation(endAnnotation)
        self.displayRoute()
    }
    
    func displayRoute() {
        
        var routeCoordinates = [CLLocationCoordinate2D]()
        for location in self.locationsTraversed {
            routeCoordinates.append(location.coordinate)
        }
        self.route = MKPolyline(coordinates: routeCoordinates, count: routeCoordinates.count)
        guard let route = route else { return }
        self.mapKitView.addOverlay(route)
        self.mapKitView.setVisibleMapRect(route.boundingMapRect, edgePadding: UIEdgeInsets(top: 200, left: 50, bottom: 50, right: 50), animated: true)
    }
}
