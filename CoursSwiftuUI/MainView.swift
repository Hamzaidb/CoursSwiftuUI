//
//  MainView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//

import SwiftUI

struct MainView: View {
    @State var isValid: Bool = false
    @State var login: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                VStack {
                    Text("Connectez vous!")
                        .padding(.leading, 20)
                    /* ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 250, height: 50) */
                    
                    TextField("Login", text: $login)
                            .frame(width: 246, height: 46)
                            .background(.white)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                TextField(Password", text: $password)
                        .frame(width: 246, height: 46)
                        .background(.white)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                
                          
                          Button {
                    isValid = viewModel.checkConnection()
                    
                }
                          
                          }
                }
                //.background(AppParameters.backgroundColor)
                
                if isValid {
                    NavigationLink(
                        destination: MenuAppsView(),
                        label: {
                            Text("Menu")
                                .padding()
                                .background(.blue)
                        })
                }
                
            }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
             //   .background(.green)
            
        }
    }

#Preview {
    MainView()
}
