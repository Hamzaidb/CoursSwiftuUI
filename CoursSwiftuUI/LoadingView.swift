//
//  LoadingView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 17/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Hello World...")
                .font(.largeTitle)
                .padding()
            
            ProgressView()
                .padding(.top, 10.0)
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    LoadingView()
}
