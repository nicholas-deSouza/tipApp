//
//  ViewController.swift
//  tipApp
//
//  Created by Nicholas de Souza on 9/13/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        billAmountTextField.becomeFirstResponder()
        
        self.title = "Tip Calculator"
        
    }
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var numPeopleSlider: UISlider!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var numPeople: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var splitAmount: UIView!
    
    @IBOutlet weak var splitTotal: UILabel!
    
    override func viewWillAppear(_ animated: Bool){
         super.viewWillAppear(animated)
           
           let defaults = UserDefaults.standard
           let bill = Double(billAmountTextField.text!) ?? 0
           
           let defaultChanged = defaults.bool(forKey: "defaultChanged")
           if (defaultChanged || bill == 0) {
               let valueOfTip = defaults.integer(forKey: "tipDefault")
               tipControl.selectedSegmentIndex = valueOfTip
               defaults.set(false, forKey: "defaultChanged")
           }
           
           self.calculateTip(self)
       }
    

    
    //slider isn't the best option for splitting the bill because of the difficulty of having all the numbers be whole but I wanted to see if I could implement it
    
    @IBAction func roundSlider(_ sender: UISlider) {
        numPeopleSlider.value = roundf(numPeopleSlider.value)
    }
    
    
    
    @IBAction func numOfPeopleSlider(_ sender: Any) {
        numPeople.text = "Split: \(Int(numPeopleSlider.value))"
    }
    
    

    @IBAction func onTap(_ sender: Any) {
        
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let split = total / Double(numPeopleSlider.value)
        
        splitTotal.text = String(format: "$%.2f" , split)
        tipAmountLabel.text = String(format: "$%.2f" , tip)
        totalAmount.text = String(format: "$%.2f", total)
        

}

}
