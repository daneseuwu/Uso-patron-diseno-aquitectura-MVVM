//
//  User.swift
//  Parcial04
//
//  Created by Douglas Deodanes on 11/17/24.
//


import Foundation
struct User: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var username: String
    var email: String
    //var password: String
    var image_profile: String?
    var isAdmin: Bool
}
