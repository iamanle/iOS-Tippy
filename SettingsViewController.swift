//
//  SettingsViewController.swift
//  tippy
//
//  Created by An Le on 3/5/17.
//  Copyright © 2017 An Le. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let DEFAULT_PERCENT_KEY = "defaultPercent"
    let DEFAULT_TIP_KEY = "defaultTip"
    let defaults =  UserDefaults.standard
    
    @IBOutlet weak var defaultTipField: UITextField!
    @IBOutlet weak var defaultSplitField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipField.placeholder = Locale.current.currencySymbol

        defaultTipField.text = defaults.object(forKey: DEFAULT_PERCENT_KEY) as? String
        
        defaultSplitField.text = defaults.object(forKey: DEFAULT_TIP_KEY) as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        defaultTipField.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func updateDefaultTip(_ sender: AnyObject) {
        defaults.set(defaultTipField.text, forKey: DEFAULT_PERCENT_KEY)
        defaults.synchronize()
    }
    
    
    @IBAction func updateDefaultSplit(_ sender: Any) {
        defaults.set(defaultSplitField.text, forKey: DEFAULT_TIP_KEY)
        defaults.synchronize()
    }
}
