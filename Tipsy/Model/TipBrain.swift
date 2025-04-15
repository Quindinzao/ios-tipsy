//
//  TipBrain.swift
//  Tipsy
//
//  Created by João Victor Fernandes on 14/04/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var tip: Tip?
    
    init(tip: Tip? = nil) {
        self.tip = tip
    }
    
    mutating func setTipPercentage(buttonTitle: String) {
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        let tipPercentageTotal = buttonTitleAsNumber / 100
        
        tip = Tip(
            tipPercentage: tipPercentageTotal,
            numberOfPeople: tip?.numberOfPeople,
            amountPerPerson: tip?.amountPerPerson
        )
    }
    
    func getTipPercentage() -> String {
        let tipPercentage = String(format: "%.0f", (self.tip?.tipPercentage ?? 0) * 100) + "%"
        return tipPercentage
    }
    
    mutating func setNumberOfPeople(numberOfPeople: Double) {
        tip = Tip(
            tipPercentage: tip?.tipPercentage,
            numberOfPeople: Int(numberOfPeople),
            amountPerPerson: tip?.amountPerPerson
        )
    }
    
    func getNumberOfPeople() -> String {
        let numberOfPeople = String(self.tip?.numberOfPeople ?? 2)
        return numberOfPeople
    }
    
    mutating func setAmountPerPerson(bill: String) {
        let billFormatted = Double(bill) ?? 0
        let tipPercentage = tip?.tipPercentage ?? 0.1
        let numberOfPeople = tip?.numberOfPeople ?? 2

        let tipAmount: Double = billFormatted * tipPercentage
        let totalAmount: Double = billFormatted + tipAmount
        let amountPerPerson: Float = Float(totalAmount) / Float(numberOfPeople)
    
        tip = Tip(
            tipPercentage: tip?.tipPercentage,
            numberOfPeople: tip?.numberOfPeople,
            amountPerPerson: amountPerPerson
        )
    }
    
    func getAmountPerPerson() -> String {
        let amountPerPerson = String(format: "%.2f", self.tip?.amountPerPerson ?? 0)
        return amountPerPerson
    }
}
