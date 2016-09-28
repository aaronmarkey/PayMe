//
//  ViewController.swift
//  PayMe
//
//  Created by Aaron Markey on 9/21/16.
//  Copyright © 2016 Aaron Markey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var payRate: UITextField!
    @IBOutlet weak var otRate: UITextField!
    @IBOutlet weak var hoursWorked: UITextField!
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var other: UITextField!

    @IBOutlet weak var otRateResult: UILabel!
    @IBOutlet weak var otHoursResult: UILabel!
    @IBOutlet weak var grossResult: UILabel!
    @IBOutlet weak var totalTaxesResult: UILabel!
    @IBOutlet weak var netResult: UILabel!
    
    
    @IBAction func calculateButton(sender: UIButton) {
        
        //some check flag
        var check = true
        
        //check payRate
        var payRateValue: Float!
        payRate.text = payRate.text!.isEmpty ? "7.25" : payRate.text
        if let value = Float(payRate.text!) {
            payRateValue = conversionSuccessful(value, text: payRate)
        } else {
            check = conversionFailure("Pay rate should be the amount made per hour. Ex: 10.75, 21.00", view: self, text: payRate)
        }
        
        //check otRate
        var otRateValue: Float!
        otRate.text = otRate.text!.isEmpty ? "1.5" : otRate.text
        if let value = Float(otRate.text!) {
            otRateValue = conversionSuccessful(value, text: otRate)
        } else {
            check = conversionFailure("Overtime rate should be the number hourly pay is raise at. Ex: 1.5, 1.75", view: self, text: otRate)
        }
        
        //check hoursWorked Field
        var hoursWorkedValue: Int!
        hoursWorked.text = hoursWorked.text!.isEmpty ? "0" : hoursWorked.text
        if let value = Int(hoursWorked.text!) {
            hoursWorkedValue = conversionSuccessful(value, text: hoursWorked)
        } else {
            check = conversionFailure("Hours Worked should be a whole value. Ex: 20, 33", view: self, text: hoursWorked)
        }
        
        //check taxRate
        var taxRateValue: Float!
        taxRate.text = taxRate.text!.isEmpty ? "0.00" : taxRate.text
        if let value = Float(taxRate.text!) {
            taxRateValue = conversionSuccessful(value/100, text: taxRate)
        } else {
            check = conversionFailure("Tax Rate should be some number. Ex: 12, 8.25", view: self, text: taxRate)
        }
        
        //check other
        var otherValue: Float!
        other.text = other.text!.isEmpty ? "0.00" : other.text
        if let value = Float(other.text!) {
            otherValue = conversionSuccessful(value, text: other)
        } else {
            check = conversionFailure("Other should be some dollar amount. Ex: 10.75, 21.00", view: self, text: other)
        }
        
        //if check passes, calculate results
        if(check) {
            let results = calculateResults(payRateValue!, otRate: otRateValue!, hoursWorked: hoursWorkedValue!, taxRate: taxRateValue, other: otherValue!)
        
            displayResults(results, otRateResult: otRateResult, otHoursResult: otHoursResult, grossResult: grossResult, totalTaxesResult: totalTaxesResult, netResult: netResult)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: UIResponder functions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextView) -> Bool {
        textField.resignFirstResponder();
        return true
    }
}

