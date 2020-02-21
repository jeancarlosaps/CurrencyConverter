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
    func getRates() -> [Double]
    func getNumbersOfRates() -> Int
}

class CurrencyConverterViewModel: CurrenciesProtocol {
    
    // MARK: - Properties
    private var rates: Rates?
    
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
    func getRates() -> [Double] {
        var ratesList = [Double]()
        
        ratesList.append(rates)
//        ratesList = Double([rates.self]) ?? 0.0
//
        return ratesList
    }
    
    func getNumbersOfRates() -> Int {
        return 1
    }
}
