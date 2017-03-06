//
//  SettingsViewController.swift
//  tippy
//
//  Created by An Le on 3/5/17.
//  Copyright © 2017 An Le. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let DEFAULT_VALUE_KEY = "defaultPercent"
    @IBOutlet weak var defaultTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults =  UserDefaults.standard
        let stringValue = defaults.object(forKey: DEFAULT_VALUE_KEY) as? String
        defaultTipField.text = stringValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let defaults =  UserDefaults.standard
        defaults.set(defaultTipField.text, forKey: DEFAULT_VALUE_KEY)
        defaults.synchronize()
    }
}
