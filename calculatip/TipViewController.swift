//
//  TipViewController.swift
//  calculatip
//
//  Created by Bianca Curutan on 9/22/16.
//  Copyright © 2016 Bianca Curutan. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var individualAmountLabel: UILabel!
    @IBOutlet weak var individualTipLabel: UILabel!
    @IBOutlet weak var individualTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.alpha = 0
        view.backgroundColor = UIColor(red:0.70, green:0.87, blue:0.86, alpha:1.0)
        settingsButton.title = "\u{2699}"
        settingsButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Helvetica", size: 28)!], for: UIControlState.normal)
        
        UIView.animate(withDuration: 1, animations: {
            self.billField.alpha = 0.7
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set remembered fields
        billField.text = defaults.string(forKey: "billAmount")
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControlIndex")
        splitControl.selectedSegmentIndex = defaults.integer(forKey: "splitControlIndex")
        
        calcTip()
        calcSplit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipControlIndex")
        defaults.synchronize()
    }
    
    @IBAction func onSplitChange(_ sender: AnyObject) {
        defaults.set(splitControl.selectedSegmentIndex, forKey: "splitControlIndex")
        defaults.synchronize()
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        defaults.set(billField.text, forKey: "billAmount")
        defaults.synchronize()
        calcTip()
        calcSplit()
    }
    
    func calcTip() {
        let tipPercentages = [0.10, 0.15, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateSplit(_ sender: AnyObject) {
        calcSplit()
    }
    
    func calcSplit() {
        let tipPercentages = [0.10, 0.15, 0.20]
        let splitPeople = [1.0, 2.0, 3.0, 4.0]
        let split = splitPeople[splitControl.selectedSegmentIndex]
        let bill = (Double(billField.text!) ?? 0) / split
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex]) / split
        let total: Double = bill + tip
        
        individualAmountLabel.text = String(format: "$%.2f", bill)
        individualTipLabel.text = String(format: "$%.2f", tip)
        individualTotalLabel.text = String(format: "$%.2f", total)
    }
}

