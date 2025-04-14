//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by João Victor Fernandes on 13/04/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: String = "0"
    var tipPertentage: String = "0.00"
    var finalValue: String = "0.00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(finalValue)"
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPertentage) tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
