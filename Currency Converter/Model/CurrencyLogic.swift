//
//  CurrencyLogic.swift
//  Currency Converter
//
//  Created by Scarlett  on 2/14/23.
//

import Foundation

struct CurrencyLogic {
    var currencyValue : Int = 0
    var eurSwitchAmount : Bool = true
    var mxnSwitchAmount : Bool = true
    var gbpSwitchAmount : Bool = true
    var audSwitchAmount : Bool = true
    
    mutating func makeAmount(_ int: Int) {
        currencyValue = int
    }
    
    mutating func makeEurSwitch(_ isOn: Bool) {
        if (isOn) {
            eurSwitchAmount = true
        } else {
            eurSwitchAmount = false
        }
    }
    
    mutating func makeMxnSwitch(_ isOn: Bool) {
        if (isOn) {
            mxnSwitchAmount = true
        } else {
            mxnSwitchAmount = false
        }
    }
    
    mutating func makeGbpSwitch(_ isOn: Bool) {
        if (isOn) {
            gbpSwitchAmount = true
        } else {
            gbpSwitchAmount = false
        }
    }
    
    mutating func makeAudSwitch(_ isOn: Bool) {
        if (isOn) {
            audSwitchAmount = true
        } else {
            audSwitchAmount = false
        }
    }
    
    func usdAmountConvert(type: String = "aud") -> Float {
        var conversionFactor: Float = 0.0
        switch type.lowercased() {
        case "eur":
            conversionFactor = 0.94
        case "mxn":
            conversionFactor = 18.60
        case "gbp":
            conversionFactor = 0.83
        case "aud":
            conversionFactor = 1.45
        default:
            conversionFactor = 1.45
        }
        let conversionAmount = Float(currencyValue) * conversionFactor
        return Float(String(format: "%.2f", conversionAmount))!
    }
    
    func retrieveAmount() -> Int {
        return currencyValue
    }
    
    func retrieveEurSwitch() -> Bool {
        return eurSwitchAmount
    }
    
    func retrieveMxnSwitch() -> Bool {
        return mxnSwitchAmount
    }
    
    func retrieveGbpSwitch() -> Bool {
        return gbpSwitchAmount
    }
    
    func retrieveAudSwitch() -> Bool {
        return audSwitchAmount
    }
}
