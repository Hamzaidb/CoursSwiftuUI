//
//  MeteoApi.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 17/10/2024.
//

import Foundation
import Combine

private enum APIKEY {
    static let key = "16eb0df2a4086217d126f957353b5810" 
}

class WeatherService {
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(APIKEY.key)&units=metric") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


