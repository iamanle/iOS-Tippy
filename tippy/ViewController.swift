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
    let DEFAULT_TIP_KEY = "defaultTip"
    let DEFAULT_TIP_PERCENT = "18"
    let defaults =  UserDefaults.standard
    var currencyFormatter = NumberFormatter()

    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.locale = Locale.current
        billField.placeholder = Locale.current.currencySymbol
        
        setDefaultValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        setDefaultValues()
        calculateTip(self)
        
        UIApplication.shared.delegate?.window??.tintColor = UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        UIView.animate(withDuration: 0.4, animations: {
            self.splitLabel.alpha = 1
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)

    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.2, 0.25, Double(getDefaultTipPercent())!/100]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        let numberOfSplit = Double(splitField.text!) ?? 1
        let eachPersonCharge = total / numberOfSplit
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        splitLabel.text = currencyFormatter.string(from: NSNumber(value: eachPersonCharge))
    }
    
    private func setDefaultValues(){
        tipControl.setTitle(getDefaultTipPercent() + "%"
            , forSegmentAt: 3)
        splitField.text = getDefaultSplit()
    }
    
    private func getDefaultTipPercent() -> String{
        var defaultTipPercentLoad = defaults.object(forKey: DEFAULT_VALUE_KEY) as? String
        
        if(defaultTipPercentLoad == nil || (defaultTipPercentLoad?.isEmpty)!) {
            defaultTipPercentLoad = DEFAULT_TIP_PERCENT
        }
        
        return defaultTipPercentLoad!
    }

    private func getDefaultSplit() -> String{
        var defaultSplit = defaults.object(forKey: DEFAULT_TIP_KEY) as? String
        
        if(defaultSplit == nil || (defaultSplit?.isEmpty)!) {
            defaultSplit = "1"
        }
        
        return defaultSplit!
    }
}

