//
//  ViewController.swift
//  Tip__Calculator
//
//  Created by Alex Towers on 9/25/19.
//  Copyright © 2019 Alex Towers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var taxPercentageLabel: UILabel!
    @IBOutlet weak var taxPercentageSlider: UISlider!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var totalAfterTaxLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalBillLabel: UILabel!
    
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    
    ///------------------------------------------------------
    ///------------------------------------------------------
    ///------------------------------------------------------
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0, taxPercentage: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateTip() {
        tipCalculator.tipPercentage = (Double(tipPercentageSlider.value)).rounded(.down) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        tipAmountLabel.text = String(format: "$%.02f", tipCalculator.tipAmount)
        tipCalculator.calculateFinalBill()
        updateUI()
    }
    
    func calculateTax() {
        tipCalculator.taxPercentage = (Double(taxPercentageSlider.value).rounded(.down) / 100.0)
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTax()
        totalAfterTaxLabel.text = String(format: "$%.02f", tipCalculator.totalAfterTax)
        tipCalculator.calculateFinalBill()
        updateUI()
        
    }
    
    func calculateSplitBill() {
        
    }
    
    func updateUI() {
        totalBillLabel.text = String(format: "$%.02f", tipCalculator.totalBillAmount)
        let numberOfPeople = Int(numberOfPeopleSlider.value)
        amountPerPersonLabel.text = String(format: "$%0.2f", tipCalculator.totalBillAmount / Double(numberOfPeople))
    }
    //MARK: Actions
    
    // Amount Before Tax Text Field
    @IBAction func amountBeforeTaxTextFieldChanged(sender: Any) {
        calculateTip()
        calculateTax()
        calculateSplitBill()
    }
    
    // Tip Slider
    @IBAction func tipPercentageSliderChanged(sender: Any) {
        tipPercentageLabel.text = String(format: "%02d%%", Int(tipPercentageSlider.value))
        calculateTip()
        calculateSplitBill()
    }
    
    // Tax Slider
    @IBAction func taxPercentageSliderChanged(sender: Any) {
        taxPercentageLabel.text = String(format: "%02d%%", Int(taxPercentageSlider.value))
        calculateTax()
        calculateSplitBill()
    }
    
    // Number of People Slider
    @IBAction func numberOfPeopleSliderChanged(sender: Any) {
        numberOfPeopleLabel.text = String(Int(numberOfPeopleSlider.value))
        calculateSplitBill()
        updateUI()
    }
    
    
}

