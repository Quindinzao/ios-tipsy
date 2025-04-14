//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tipSelected: Double = 0.1
    var numberOfPeopleSelected: Int = 2
    var finalValue: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        // Angela resolution
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        
        tipSelected = buttonTitleAsNumber / 100

//        My resolution
//        if (zeroPctButton.isSelected == true) {
//            tipSelected = 0
//        } else if (tenPctButton.isSelected == true) {
//            tipSelected = 0.1
//        } else if (twentyPctButton.isSelected == true) {
//            tipSelected = 0.2
//        } else {
//            tipSelected = nil
//        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeopleSelected = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount: Double = Double(billTextField.text ?? "") ?? 0
        let tipAmount: Double = billAmount * tipSelected
        let totalAmount: Double = billAmount + tipAmount
        let amountPerPerson: Float = Float(totalAmount) / Float(numberOfPeopleSelected)
        finalValue = amountPerPerson
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.numberOfPeople = String(numberOfPeopleSelected)
            destinationVC.tipPertentage = String(tipSelected * 100)
            destinationVC.finalValue = String(finalValue)
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
