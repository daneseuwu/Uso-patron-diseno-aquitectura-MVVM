//
//  HomeView.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject  var viewModel = AuthViewModel()
    
    var body: some View {
        Text("Hola, Bienvenido! Haz iniciado session")
            .font(.largeTitle)
        
        Button(action: {
         
            AuthService.shared.signOut()
       
            
        }) {
            Text("Salir")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 350, height: 40)
                .background(Color.black)
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
