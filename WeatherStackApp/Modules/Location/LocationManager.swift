//
//  LocationManager.swift
//  WeatherStackApp
//
//  Created by Hussein Anwar on 17/12/2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    var getCurrentLocationClosure : (()->())?
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    public var currentLocation: CLLocation? {
        return self.locationManager.location
    }
}


// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("notDetermined")
            self.locationManager.requestWhenInUseAuthorization()
            // location permission not asked for yet
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            getCurrentLocationClosure?()
        case .authorizedAlways:
            print("authorizedAlways")
            getCurrentLocationClosure?()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied, please allow")
        }
    }
}

extension LocationManager {
    func getUserLocation(for location: CLLocation,
                         completion: @escaping (CLPlacemark?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil else {
                completion(nil)
                return
            }
            guard let placemark = placemarks?[0] else {
                completion(nil)
                return
            }
            completion(placemark)
        }
    }
}

