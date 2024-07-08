//
//  ContentView.swift
//  WeatherNow
//
//  Created by Rachel on 6/30/24.
//

import SwiftUI

struct Weather: View {
//    
//    @ObservedObject var networkManager = NetworkManager()
    
        @ObservedObject var weathervm = WeatherViewModel()
    
    
    var body: some View {
//        if let weatherData = networkManager.weather {
//            Text("\(weatherData.current.temp_f)")
//        } else {
//                    Text("Loading Weather")
//}
        
        
        VStack {
            Spacer()
            Text("\(weathervm.cityName)")
                .font(.system(size:30))
                .bold()
            Text("\(Date().formatted(date:.complete, time:.omitted))")
            Text("\(weathervm.weatherEmoji)")
                .font(.system(size: 90))
            Text("\(weathervm.currentTemp)°F")
                .bold()
            Text("\(weathervm.weatherCondition)")
                .font(.system(size: 20))
            Spacer()
            List{
            
                    Text("Day forecast")
                    Text("Day forecast")
                    Text("Day forecast")
                
            }
            .scrollContentBackground(.hidden)
        }
        .onAppear {
            weathervm.fetchData()
        }
        .padding()
        .background(Color.cyan)
        
    }
}


#Preview {
    Weather()
}
