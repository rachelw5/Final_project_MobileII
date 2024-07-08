//
//  WeatherViewModel.swift
//  WeatherNow
//
//  Created by Rachel on 6/30/24.
//

import Foundation

class WeatherViewModel : ObservableObject {
    
    @Published private(set) var weatherData = [Forecast]()
    @Published private(set) var locationData = Location(name: "")
    
    @Published var weatherEmoji = "☀️"
    @Published var currentTemp = "70"
    @Published var weatherCondition = "Sunny"
    @Published var cityName = "London"
    
    private let url = "https://api.weatherapi.com/v1/forecast.json?key=d290bb881c5a411a927150153240707&q=London&days=3&aqi=no&alerts=no"
    
    func fetchData() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
//                                let results = try JSONDecoder().decode(WeatherResults.self, from: data)
                                let decoder = JSONDecoder()
                                let results = try decoder.decode(WeatherResults.self, from: data)
                                DispatchQueue.main.async {
                                    self.weatherData = results.forecast
                                    self.locationData = results.location
                                    self.weatherEmoji = self.getWeatherEmoji(text: results.current.condition.text)
                                    self.currentTemp = "\(results.current.temp_f)"
                                    self.weatherCondition = results.current.condition.text
                                    self.cityName = results.location.name
                                }

                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }



    
    
    
    private func getWeatherEmoji(text: String) -> String {
        var weatherEmoji = "☀️"
        let weatherCondition = text.lowercased()
        if weatherCondition.contains("sunny") || weatherCondition.contains("clear"){
            weatherEmoji = "☀️"
        } else if weatherCondition.contains("cloudy") || weatherCondition.contains("overcast") {
            weatherEmoji = "☁️"
        } else if weatherCondition.contains("rain") {
            weatherEmoji = "🌧️"
        } else if weatherCondition.contains("snow") || weatherCondition.contains("blizzard") {
            weatherEmoji = "❄️"
        }
        return weatherEmoji
    }
    
}


