//
//  SettingsViewController.swift
//  tipApp
//
//  Created by Nicholas de Souza on 9/13/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var settingsTip: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func changeTipDefault(_ sender: AnyObject) {
        let tipIndex = settingsTip.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(tipIndex, forKey: "tipDefault")
        defaults.set(true, forKey: "defaultChanged")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let valueOfTip = defaults.integer(forKey: "tipDefault")
       
        
        settingsTip.selectedSegmentIndex = valueOfTip
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
