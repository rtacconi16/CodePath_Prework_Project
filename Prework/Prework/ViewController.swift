//
//  ViewController.swift
//  Prework
//
//  Created by Ricardo Tacconi on 7/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peoplePaying: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var amountPerPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let peoplePaying = Int(peoplePaying.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let totalPerPerson = (total) / Double(peoplePaying)
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        amountPerPerson.text = String(format: "$%.2f", totalPerPerson)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peoplePaying.text = Int(sender.value).description
    }
}

