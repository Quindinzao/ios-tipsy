//
//  Tip.swift
//  Tipsy
//
//  Created by João Victor Fernandes on 14/04/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    var tipPercentage: Double?
    var numberOfPeople: Int?
    var amountPerPerson: Float?

    init (tipPercentage: Double? = 0.1, numberOfPeople: Int? = 2, amountPerPerson: Float? = 0.0) {
        self.tipPercentage = tipPercentage
        self.numberOfPeople = numberOfPeople
        self.amountPerPerson = amountPerPerson
    }
}
