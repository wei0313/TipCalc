//
//  ViewController.swift
//  TipCal
//
//  Created by Agnes Sun on 2/28/17.
//  Copyright © 2017 Agnes Sun. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountSeg: UISegmentedControl!
    var tipPerc: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var minPerc = 0
        var inc = 0
        
        let defaults = UserDefaults.standard
        minPerc = defaults.integer(forKey: "minPercent")
        inc = defaults.integer(forKey: "increment")
        
        if minPerc == 0 {
            minPerc = 18
            defaults.set(minPerc, forKey: "minPercent")
        }
        if inc == 0 {
            inc = 2
            defaults.set(inc, forKey: "increment")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        //let tipPerc = [0.18, 0.2, 0.22]
        
        calc()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadTipPercentage()
        
        calc()
        
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func loadTipPercentage() {
        let defaults = UserDefaults.standard
        let minPerc = defaults.integer(forKey: "minPercent")
        let inc = defaults.integer(forKey: "increment")
        
        for i in 0...2 {
            let title = minPerc + ( i * inc )
            tipAmountSeg.setTitle("\(title)%", forSegmentAt: i)
            tipPerc.insert( Double(title) / 100.0,  at: i)
        }
    }
    
    func calc() {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPerc[tipAmountSeg.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

