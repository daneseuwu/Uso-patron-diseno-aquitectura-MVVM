//
//  AuthService.swift
//  Parcial04
//  Created by Douglas Deodanes on 11/17/24.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var errorMessage: String?
    
    static let shared = AuthService()
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
  
    @MainActor
    func signIn(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: USER LOGIN SUCCESS \(result.user.uid)")
        } catch {
            self.errorMessage = error.localizedDescription
            print("DEBUG: ERROR USER LOGIN \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signUp(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            print("DEBUG: USER CREATE SUCCESS \(result.user.uid)")

        } catch {
            self.errorMessage = error.localizedDescription
            print("DEBUG: ERROR USER SIGNUP \(error.localizedDescription)")
        }
    }

    func resetPassword(withEmail email: String) async throws {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
            } catch {
                throw error
            }
        }

    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            self.errorMessage = error.localizedDescription
            print("DEBUG: ERROR USER SIGNOUT \(error.localizedDescription)")
        }
    }
}
