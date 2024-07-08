//
//  WeatherModel.swift
//  WeatherNow
//
//  Created by Rachel on 7/2/24.
//

import Foundation

struct WeatherResults : Decodable {
    let location : Location
    let current : CurrentWeather
    let forecast : [Forecast]
}
