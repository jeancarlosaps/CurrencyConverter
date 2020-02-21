//
//  CurrencyConverterViewController.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/23/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = CurrencyConverterViewModel()
    
    
    // MARK: - Outlets
    @IBOutlet weak var currencyTypePickerView: UIPickerView!
    @IBOutlet weak var desideredCurrencyPickerView: UIPickerView!
    @IBOutlet weak var currencyTypeValue: UITextField!
    
    @IBOutlet weak var currencyTypeNewValue: UITextField!
    @IBOutlet weak var btnConverter: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTypeValue.delegate = self
        currencyTypePickerView.delegate = self
        
        
        configureTextField()
        print("Antes \(viewModel.getRates())")
        viewModel.fetchCurrencies()
    }
    
    // MARK: - Properties
       private func configureTextField() {
           currencyTypeValue.tintColor = UIColor.lightGray
           currencyTypeNewValue.tintColor = UIColor.lightGray
           
           currencyTypeValue.placeholder = StringsHelper.value
           currencyTypeNewValue.placeholder = StringsHelper.newValue
       }
    
    // MARK: - Actions
    @IBAction func currencyConverter(_ sender: Any) {
        currencyTypeNewValue.text = String(viewModel.converter(inputValue: 0.0, newValue: 0.0))
    }
}

// MARK: - Extensions
extension CurrencyConverterViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return  NSLog("%@", rates[row].AUD)
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        currencyTypeValue.text = String(rates[row])
    }
}

extension CurrencyConverterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getNumbersOfRates()
    }
    
    
}

extension CurrencyConverterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Depois \(viewModel.getRates())")
    }
}
