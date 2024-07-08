//
//  ForecastDayModel.swift
//  WeatherNow
//
//  Created by Rachel on 7/2/24.
//

import Foundation

struct ForecastDay : Codable, Identifiable {
    let date_epoch : Int
    var id : Int {date_epoch}
    let day : Day
}

struct Day : Codable {
    let avgtemp_f : Double
    let condition : WeatherCondition
}


struct WeatherCondition : Codable {
    let text : String
}

struct CurrentWeather : Codable, Observable {
    var id : Int
    let temp_f : Double
    let condition: WeatherCondition
}
