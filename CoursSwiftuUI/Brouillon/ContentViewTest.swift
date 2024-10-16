//
//  ContentView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import SwiftUI

struct ContentViewTest: View {
    @State var appui1: Int = 0
    var appui2: Int = 0
    var appui3: Int = 0
    
    var body: some View {
        VStack {
            Text("Test")
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.purple)
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120.0, height: 40.0)
            
            Button {
                appui1 += 1
            } label: {
                ZStack {
                    Circle()
                        .fill(Color(red: 1, green: 1, blue: 20/255))
                        .frame(width: 40, height: 40)
                    Text("\(appui1)")
                    
                }
            }
            HStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 1, green: 1, blue: 20/255))
                        .frame(width: 40, height: 40)
                    Text("\(appui2)")
                }
            }
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 1, blue: 20/255))
                    .frame(width: 40, height: 40)
                Text("\(appui3)")
            }
        }
        .padding(.horizontal)
    }
    
    func getNote() -> Int {
        Int.random(in: 0...20)
    }
}

#Preview {
    ContentViewTest()
}


