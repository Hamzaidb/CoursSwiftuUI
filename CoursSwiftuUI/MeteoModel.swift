//
//  MeteoModel.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 17/10/2024.
//

import Foundation
import Combine


struct WeatherResponse: Codable, Equatable {
    let main: Main
    let weather: [Weather]
    let name: String
}

struct Main: Codable, Equatable {
    let temp: Double
}

struct Weather: Codable, Equatable {
    let description: String
    let id: Int
}

class WeatherViewModel: ObservableObject {
    
    private let weatherService = WeatherService()
    private var cancellable: AnyCancellable?
    @Published var weather: WeatherResponse?
    
    func fetchWeather(city: String) {
        cancellable = weatherService.getWeather(for: city)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { weather in
                self.weather = weather
            })
    }
}
