//
//  Weather.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/4/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let list: [CityWeather]
}

struct CityWeather: Decodable {
    var name: String
    var weather: [Weather]
    var main: Main
}

struct Weather: Decodable {
    var main: String
}

struct Main: Decodable {
    var temp: Double
}
extension WeatherData {
    static func getWeather (from data: Data) -> [CityWeather] {
        var weather = [CityWeather]()
        do {
           let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            weather = weatherData.list
        } catch { fatalError("Can't parse data \(error)")
        }
        return weather
    }
}
