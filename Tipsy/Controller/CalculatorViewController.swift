//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tipBrain = TipBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

//    var tipSelected: Double = 0.1
//    var numberOfPeopleSelected: Int = 2
//    var finalValue: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        tipBrain.setTipPercentage(buttonTitle: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipBrain.setNumberOfPeople(numberOfPeople: sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        tipBrain.setAmountPerPerson(bill: billTextField.text ?? "0")
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" && billTextField.text != nil {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.numberOfPeople = tipBrain.getNumberOfPeople()
            destinationVC.tipPertentage = tipBrain.getTipPercentage()
            destinationVC.finalValue = tipBrain.getAmountPerPerson()
        }
    }
}
