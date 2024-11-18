//
//  SignupView.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import SwiftUI

struct SignupView: View {
    @StateObject  var viewModel = AuthViewModel()
    
    var body: some View {
     
        NavigationStack{
            VStack{
                
                Text("Crear una cuenta para iniciar session")
                    .fontWeight(.bold)
                    .padding(.bottom, 100)
                
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal,24)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal,24)
            }
            
            Button(action: {
                Task{
                    try await viewModel.signupUser()
                }
                
            }) {
                Text("Crear una nueva cuenta")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 40)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            .padding()
            
            NavigationLink {
                SigninView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Ya tengo una cuenta?")
        
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
            .tint(.black)
            
        }
    
    }
}

#Preview {
    SignupView()
}
