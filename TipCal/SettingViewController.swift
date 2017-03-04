//
//  SettingViewController.swift
//  TipCal
//
//  Created by Agnes Sun on 2/28/17.
//  Copyright © 2017 Agnes Sun. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var percentField: UITextField!
    @IBOutlet weak var incSlider: UISlider!
    @IBOutlet weak var incLabel: UILabel!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var perc1Label: UILabel!
    @IBOutlet weak var perc2Label: UILabel!
    @IBOutlet weak var perc3Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let minPerc = defaults.integer(forKey: "minPercent")
        let inc = defaults.integer(forKey: "increment")
        
        percentField.text = String(minPerc)
        incSlider.value = Float(inc)
        
        incLabel.text = String(format: "%.0f", incSlider.value) 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.set(Int(percentField.text!), forKey: "minPercent")
        defaults.set(incSlider.value, forKey: "increment")
        defaults.synchronize()
        
        navigationController?.popViewController(animated: true)
        
    }

    @IBAction func sliderUpdate(_ sender: Any) {
        animateView()
        incLabel.text = String(format: "%.0f", incSlider.value)
        let perc = Int(percentField.text!)
        let sliderV = Int(incSlider.value)
        
        perc1Label.text = "First Tip Value: \(perc!)%"
        perc2Label.text = "Second Tip Value: \(perc! + sliderV)%"
        perc3Label.text = "Third Tip Value \(perc! + 2 * sliderV)%"
    }
    
    func animateView() {
        UIView.animate(withDuration: 3) {
            self.animationView.alpha = 1
            self.animationView.alpha = 0
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
