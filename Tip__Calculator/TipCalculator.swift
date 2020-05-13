//
//  TipCalculator.swift
//  Tip__Calculator
//
//  Created by Alex Towers on 9/27/19.
//  Copyright © 2019 Alex Towers. All rights reserved.
//

import Foundation

class TipCalculator {
    var amountBeforeTax: Double = 0
    
    var tipPercentage: Double = 0
    var tipAmount: Double = 0
    
    var taxPercentage: Double = 0
    var taxAmount: Double = 0
    var totalAfterTax: Double = 0
    
    var totalBillAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double, taxPercentage: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
        self.taxPercentage = taxPercentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
        //totalBillAmount = tipAmount + amountBeforeTax
    }
    
    func calculateTax() {
        taxAmount = amountBeforeTax * taxPercentage
        totalAfterTax = taxAmount + amountBeforeTax
    }
    
    func calculateFinalBill() {
        tipAmount = amountBeforeTax * tipPercentage
        taxAmount = amountBeforeTax * taxPercentage
        totalBillAmount = tipAmount + taxAmount + amountBeforeTax
    }
    
}
