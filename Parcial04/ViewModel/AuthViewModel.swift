//
//  AuthViewModel.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

class AuthViewModel: ObservableObject, AuthenticationFormProtocol {

    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var user: User?
    
    var formIsValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }

    @MainActor
    func signinUser() async throws {
        try  await AuthService.shared.signIn(withEmail: email, password: password)
    }
    
    @MainActor
    func signupUser() async throws{
        try await AuthService.shared.signUp( withEmail: email, password: password)
    }
    
    @MainActor
        func resetPassword() async throws {
                try await AuthService.shared.resetPassword(withEmail: email)
        }

}
