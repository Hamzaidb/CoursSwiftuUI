//
//  ContentView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "wind.snow.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, hamza!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
