//
//  IconView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 16/10/2024.
//

import SwiftUI

struct IconView: View {
    let image: Image
    let name: String
    @State private var scale: CGFloat = 0.5 // Échelle initiale
    @State private var opacity: Double = 0.2 // Opacité initiale

    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.bottom, 5)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                .padding(5)
                .scaleEffect(scale) // Appliquer l'échelle
                .opacity(opacity) // Appliquer l'opacité
                .animation(.easeOut(duration: 0.4), value: scale) // Animation de l'échelle
                .animation(.easeOut(duration: 0.4), value: opacity) // Animation de l'opacité
                .onAppear {
                    withAnimation(.easeOut(duration: 0.4)) {
                        scale = 1.0 // Zoomer à l'échelle finale
                        opacity = 1.0 // Passer à l'opacité finale
                    }
                }

            Text(name)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .transition(.scale)
    }
}

#Preview {
    IconView(image: Image(systemName: "list.bullet"), name: "Todo-List")
}

