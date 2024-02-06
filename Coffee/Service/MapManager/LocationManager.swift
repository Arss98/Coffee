//
//  LocationManager.swift
//  Coffee
//
//  Created by  Arsen Dadaev on 05.02.2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    let locationManager = CLLocationManager()
    private static let shared = LocationManager()
    
    override init() {
        super.init()
        setupLocationManager()
        location()
    }
    
    func distanceToLocation(latitude: Double, longitude: Double) -> Double? {
        guard let userLocation = locationManager.location else {
            return nil
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInMeters = userLocation.distance(from: location)
        let distanceInKilometers = distanceInMeters / 1000.0
        let roundedDistance = (distanceInKilometers * 100).rounded() / 100
        return roundedDistance
    }
    
    static func getCurrentLocation() -> (latitude: CLLocationDegrees?, longitude: CLLocationDegrees?) {
        let location = LocationManager.shared.locationManager.location?.coordinate
        
        return (location?.latitude, location?.longitude)
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        location()
    }
}

// MARK: Private methods
private extension LocationManager {
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func location() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
