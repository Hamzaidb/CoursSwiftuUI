//
//  MeteoView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 17/10/2024.
//

import SwiftUI
import Combine

struct WeatherView: View {
    @State private var city: String = ""
    @State private var showWeather = false 
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("Ma météo")
                .font(.largeTitle)
                .padding()
                .font(.system(size: 24))
                .fontWeight(.light)
            
            HStack {
                TextField("Entrer la ville", text: $city, onCommit: {
                    fetchWeather()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Button(action: {
                    fetchWeather()
                }) {
                    Text("Entrer")
                        .padding()
                        .foregroundColor(.blue)
                        .cornerRadius(30)
                }
            }
            
            if showWeather, let weather = weatherViewModel.weather {
                VStack {
                    weatherIcon
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Météo à \(weather.name)")
                        .font(.title)
                        .padding()
                    
                    Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C")
                        .font(.headline)
                        .padding()
                    
                    Text(weather.weather.first?.description.capitalized ?? "")
                        .font(.subheadline)
                }
                .transition(.opacity)
            }
        }
        .padding()
        .padding(.bottom, 70.0)
        .onChange(of: weatherViewModel.weather) { _ in
            withAnimation {
                showWeather = true
            }
        }
    }
    
    private func fetchWeather() {
        weatherViewModel.fetchWeather(city: city)
        showWeather = false
    }
    
    private var weatherIcon: some View {
        let condition = weatherViewModel.weather?.weather.first?.description ?? ""
        
        let iconName: String
        
        switch condition {
        case let x where x.contains("rain"):
            iconName = "cloud.rain"
        case let x where x.contains("sunny") || x.contains("clear"):
            iconName = "sun.max"
        case let x where x.contains("cloud"):
            iconName = "cloud"
        default:
            iconName = "questionmark"
        }
        
        return Image(systemName: iconName)
            .foregroundColor(.blue)
    }
}

#Preview {
    WeatherView()
}
