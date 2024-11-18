//
//  ContentView.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                HomeView()
            }else {
                SigninView()
            }
        }
    }
}

#Preview {
    ContentView()
}
