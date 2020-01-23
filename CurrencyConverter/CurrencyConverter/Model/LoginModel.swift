//
//  LoginModel.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/22/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import Foundation

struct Login: Codable {
    let userNameOrEmail: String
    let password: String
    let userWithFacebook: String
    let userWithTwitter: String
    let userWithGoogle: String
}
