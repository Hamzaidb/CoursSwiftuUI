//
//  MainView.swift
//  CoursSwiftuUI
//
//  Created by IDBOUIGUIGUANE Hamza on 15/10/2024.
//


// Projet SwiftUI

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    @State var login: String = ""
    @State var password: String = ""
    @State var alert: Bool = false
    
    @State private var currentTime = ""
    @State private var timer: Timer?
    
    @State private var scale: CGFloat = 0.5
    
    @State private var isLoading = true

    
    var body: some View {
        NavigationStack {
            ZStack {  if isLoading {
                LoadingView()
            } else {
                
                Image("bgImage") // 1
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    if !viewModel.isValid {
                        
                        //Horloge
                        Text(currentTime)
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                            .padding(.leading, 30)
                            .foregroundColor(.white)
                            .shadow(
                                color: Color.white.opacity(0.7), /// shadow color
                                radius: 4, /// shadow radius
                                x: 0, /// x offset
                                y: 0/// y offset
                            )
                        
                    }
                    
                    
                    
                    if !viewModel.isValid {
                        VStack {
                            Text("Connectez-vous")
                                .padding(.leading, 0)
                                .padding(.bottom, 10)
                                .foregroundColor(.white)
                                .shadow(
                                    color: Color.white.opacity(0.7), /// shadow color
                                    radius: 4, /// shadow radius
                                    x: 0, /// x offset
                                    y: 0/// y offset
                                )
                            
                            customTextField(text: $login, placeholder: "Login")
                            
                            
                            customTextField(text: $password, placeholder: "Password", isSecure: true)
                                .padding(.top, 10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            
                            
                            
                            
                            Button {
                                
                                guard login != "" else {
                                    alert = true
                                    return
                                }
                                viewModel.checkConnection(login: login, password: password)
                                
                                
                            } label: {
                                Text("Se connecter")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.top, 20)
                            .shadow(
                                color: Color.blue.opacity(0.9), /// shadow color
                                radius: 6, /// shadow radius
                                x: 0, /// x offset
                                y: 0/// y offset
                            )
                        }
                    } else {
                        
                        ZStack {
                            NavigationLink(destination: MenuAppsView()) {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "square.grid.3x3")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                            .scaleEffect(scale)
                                            .animation(.easeOut(duration: 0.4), value: scale)
                                            .onAppear {
                                                withAnimation(.easeOut(duration: 0.4)) {
                                                    scale = 1.0
                                                }
                                            }
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    
                                    Button(action: {
                                        viewModel.disconnect()
                                    }) {
                                        Text("Se déconnecter")
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.red)
                                            .cornerRadius(10)
                                    }
                                    .padding(.top, 20)
                                }
                            }
                        }
                        
                        .padding(.top, 10)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Alerte"), message: Text("Vous devez entrer un login"))
                }
            } } }
        .onAppear {
                    updateTime()
                
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                            }
                        
                }
                .onDisappear {
                    timer?.invalidate()
                }
    }
    
  
        private func updateTime() {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"

            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                currentTime = formatter.string(from: Date())
            }
        }
    
    

    
    private func customTextField(text: Binding<String>, placeholder: String, isSecure: Bool = false) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 3) // Bordure blanche
                .shadow(color: Color.white.opacity(0.9), radius: 8, x: 0, y: 0)
            
            if text.wrappedValue.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
            }
            
            TextField("", text: text)
                .padding()
                .foregroundColor(.white)
                .background(Color.clear) 
            
            
        }
        
        .frame(width: 246, height: 44)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    }




#Preview {
    MainView()
}
