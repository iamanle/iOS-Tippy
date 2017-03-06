//
//  ViewController.swift
//  tippy
//
//  Created by An Le on 3/4/17.
//  Copyright © 2017 An Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let DEFAULT_VALUE_KEY = "defaultPercent"

    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultTipPercent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        setDefaultTipPercent()
        calculateTip(self)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults =  UserDefaults.standard
        let stringValue = (defaults.object(forKey: DEFAULT_VALUE_KEY) as? String) ?? "18"
        let tipPercentages = [0.18, 0.2, 0.25, Double(stringValue)!/100]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let numberOfSplit = Double(splitField.text!) ?? 1
        let eachPersonCharge = total / numberOfSplit
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", eachPersonCharge)
    }
    
    func setDefaultTipPercent(){
        let defaults =  UserDefaults.standard
        var stringValue = defaults.object(forKey: DEFAULT_VALUE_KEY) as? String
        stringValue = (stringValue ?? "18") + "%"
        tipControl.setTitle(stringValue
            , forSegmentAt: 3)
    }
}

