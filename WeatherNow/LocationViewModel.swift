//
//  LocationViewModel.swift
//  WeatherNow
//
//  Created by Rachel on 7/2/24.
//
//
//import Foundation
//import CoreLocation
//import Combine
//
//class LocationViewModel: NSObject, ObservableObject {
//    @Published var userLatitude : Double = 51.494720
//    @Published var userLongitude : Double = -0.135278
//    
//    private let locationManager = CLLocationManager()
//    
//    override init() {
//        super.init()
//        self.locationManager.delegate = self
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
//    }
//}
//
//extension LocationViewModel: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        userLatitude = location.coordinate.latitude
//        userLongitude = location.coordinate.longitude
//    }
//}
