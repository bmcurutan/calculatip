//
//  SettingsViewController.swift
//  calculatip
//
//  Created by Bianca Curutan on 9/22/16.
//  Copyright © 2016 Bianca Curutan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var greySwitch: UISwitch!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let greyOn = defaults.bool(forKey: "greyOn")
        greySwitch.isOn = greyOn
        greySwitch.tintColor = greyOn ? UIColor(red:0.459, green:0.459, blue:0.459, alpha:1.0) : UIColor(red: 1, green:0.757, blue:0.027, alpha:1.0)
        tipControl.tintColor = greyOn ? UIColor(red:0.459, green:0.459, blue:0.459, alpha:1.0) : UIColor(red: 1, green:0.757, blue:0.027, alpha:1.0)
        resetButton.setTitleColor(greyOn ? UIColor.black : UIColor(red: 0, green:0.475, blue:0.42, alpha:1.0), for: UIControlState.normal)
        resetButton.backgroundColor = greyOn ? UIColor(red:0.741, green:0.741, blue:0.741, alpha:1.0) : UIColor(red:0.70, green:0.87, blue:0.86, alpha:1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTipChange(_ sender: AnyObject) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipControlIndex")
        defaults.synchronize()
    }
    
    @IBAction func onGreyChange(_ sender: AnyObject) {
        defaults.set(greySwitch.isOn, forKey: "greyOn")
        defaults.synchronize()
    }
    
    @IBAction func onPress(_ sender: AnyObject) {
        defaults.set(0, forKey: "tipControlIndex")
        defaults.set(0, forKey: "splitControlIndex")
        defaults.synchronize()
    }
}
