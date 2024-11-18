//
//  ContentViewModel.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import Foundation
import FirebaseAuth

class ContentViewModel : ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        setupSuscribe()
    }

    private func setupSuscribe(){
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }
    }
}
