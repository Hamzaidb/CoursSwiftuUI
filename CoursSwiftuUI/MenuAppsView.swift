//
//  MenuAppsView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import SwiftUI

struct MenuAppsView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bgImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) { // Augmenter l'espacement pour un effet plus réaliste
                            ForEach(availableApps.allCases, id: \.self) { application in
                                NavigationLink(destination: application.destinationView) {
                                    IconView(image: application.image, name: application.title)
                                        .transition(.scale) // Appliquer la transition ici
                                }
                            }
                        }
                        .padding(70) // Ajuster le padding
                    }
                }
                .onAppear {
                    // Initialisation si nécessaire
                }
                .onDisappear {
                    // Sauvegarde si nécessaire
                }
            }
        }
    }
}

#Preview {
    MenuAppsView()
}



