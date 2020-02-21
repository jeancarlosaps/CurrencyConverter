//
//  Service.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/23/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

struct Service {
    
    static func fetchCurrencies(handler: @escaping ((CurrencyResponse?, String?) -> Void)) {
        guard let url = URL(string: StringsHelper.url) else {
            handler(nil, "URL format error")
            return
        }
        
        Alamofire.request(url).responseJSON { response in
            guard let data = response.data else {
                handler(nil, "Internal server error")
                return
            }
            
            let json = String(data: data, encoding: .utf8) ?? "json cannot be converted"
            print(json)
            
            do {
                let currencies = try JSONDecoder().decode(CurrencyResponse.self, from: data)
                handler(currencies, nil)
            } catch(let error) {
                handler(nil, error.localizedDescription)
            }
        }
    }
}
