//
//  CurrencyConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 2/20/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import Foundation

//MARK: - Protocols
protocol CurrenciesProtocol {
    func getRates() -> [Rates]
    func getNumbersOfRates() -> Int
    func getNameRate(row: Int) -> Int
}

class CurrencyConverterViewModel: CurrenciesProtocol {
    
    // MARK: - Properties
    private var rates: Rates?
    var ratesList = [Double]()
    
    // MARK: - Methods
    func converter(inputValue: Double, newValue: Double) -> Double{
        var convertedValue = 0.0
        convertedValue = inputValue * newValue
        
        return convertedValue
    }
    
    func fetchCurrencies() {
        Service.fetchCurrencies { (response, error) in
            if let errorMessage = error {
                print(errorMessage)
                return
            }
            
            guard let currencies = response else {
                print("No data found")
                return
            }
            
            self.rates = currencies.rates
            print(currencies)
        }
    }
    
    // MARK: - Protocols implemented
    func getRates() -> [Rates] {
        var ratesList = [Rates]()
        
        ratesList.append(rates ?? Rates(CAD: 0.0, HKD: 0.0, ISK: 0.0, PHP: 0.0, DKK: 0.0, HUF: 0.0, CZK: 0.0, AUD: 0.0, RON: 0.0, SEK: 0.0, IDR: 0.0, INR: 0.0, BRL: 0.0, RUB: 0.0, HRK: 0.0, JPY: 0.0, THB: 0.0, CHF: 0.0, SGD: 0.0, PLN: 0.0, BGN: 0.0, TRY: 0.0, CNY: 0.0, NOK: 0.0, NZD: 0.0, ZAR: 0.0, USD: 0.0, MXN: 0.0, ILS: 0.0, GBP: 0.0, KRW: 0.0, MYR: 0.0))
        
        return ratesList
    }
    
    func getNumbersOfRates() -> Int {
        return ratesList.count
    }
    
    func getNameRate(row: Int) -> Int {
        return Int(ratesList[row])
    }
    
}
