//
//  SigninView.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import SwiftUI

struct SigninView: View {
    @StateObject  var viewModel = AuthViewModel()
    @State private var isAuthenticated = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("brand")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
//                Text("Parcial 4 - ETPS4")
//                    .fontWeight(.bold)
//                    .padding(.bottom, 100)
                
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
            
            NavigationLink {
                SignupView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Desea registrarse?")
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
            .tint(.black)
            
            NavigationLink {
                ForgotPasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Olvido su password?")
        
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
            .tint(.black)
            
            Button(action: {
                Task{
                    try await viewModel.signinUser()
                }
                
            }) {
                Text("Ingresar")
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
}

#Preview {
    SigninView()
}
