//
//  CurrencyConverterModel.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/23/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import Foundation

struct CurrencyResponse: Codable {
    let rates: Rates
    
    private enum CodingKeys: String, CodingKey {
        case rates
    }
}

struct Rates: Codable {
    let CAD: Double
    let HKD: Double
    let ISK: Double
    let PHP: Double
    let DKK: Double
    let HUF: Double
    let CZK: Double
    let AUD: Double
    let RON: Double
    let SEK: Double
    let IDR: Double
    let INR: Double
    let BRL: Double
    let RUB: Double
    let HRK: Double
    let JPY: Double
    let THB: Double
    let CHF: Double
    let SGD: Double
    let PLN: Double
    let BGN: Double
    let TRY: Double
    let CNY: Double
    let NOK: Double
    let NZD: Double
    let ZAR: Double
    let USD: Double
    let MXN: Double
    let ILS: Double
    let GBP: Double
    let KRW: Double
    let MYR: Double
}
