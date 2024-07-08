//
//  WeatherManager.swift
//  WeatherNow
//
//  Created by Rachel on 7/2/24.
//
//
//import Foundation
//import Combine
//import SwiftUI
//import CoreLocation
//
//class WeatherManager : ObservableObject {
//    static let key = "d290bb881c5a411a927150153240707"
//    static let baseURL = "https://api.weatherapi.com/v1/forecast.json?key=d290bb881c5a411a927150153240707"
//}
//
//class NetworkManager : ObservableObject {
//    @Published var didChange = PassthroughSubject<NetworkManager, Never>()
//    @Published var weather: WeatherResults? {
//        didSet {
//            didChange.send(self)
//        }
//    }
//    
//    init() {
//        getWeather()
//    }
//    
//    @Published var locationViewModel = LocationViewModel()
//    
//    private func getWeather() {
//        guard let url = URL(string: WeatherManager.baseURL + "&q=\(locationViewModel.userLatitude),\(locationViewModel.userLongitude)") else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .secondsSince1970
//                let weatherObject = try decoder.decode(WeatherResults.self, from: data)
//                DispatchQueue.main.async {
//                    self.weather = weatherObject
//                }
//            } catch {
//                print(error)
//            }
//        }.resume()
//    }
//}
