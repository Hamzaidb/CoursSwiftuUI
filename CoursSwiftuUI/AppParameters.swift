//
//  AppParameters.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import SwiftUI

class AppParameters {
    static let backgroundColor: Color = .orange
    static var isValid: Bool = true
}

enum availableApps: String {
    static let allCases: [availableApps] = [.todoList, .meteo]
    
    case todoList = "Todo-List"
    case meteo = "Meteo"
    
    
    var image: Image {
        switch self {
        case .todoList:
            return Image(systemName: "list.bullet")
        case .meteo:
            return Image(systemName: "cloud.sun")
        

        }
    }
    
    
    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .todoList:
            TodoView()
        case .meteo:
            WeatherView()
        }
        
    }
    
    var title: String {
        switch self {
        case .todoList:
            return "Todo-List"
        case .meteo:
            return "Meteo"
        
            
        }
    }
}
