//
//  Utitlities.swift
//  PayMe
//
//  Created by Aaron Markey on 9/21/16.
//  Copyright © 2016 Aaron Markey. All rights reserved.
//

import UIKit

/**
 Shows alert message
 
 - Parameter errorMessage: The message to show in the error.
 - Parameter view: The view to display this alert on top of.
*/
func createAndDisplayErrorAlert(errorMessage: String, view: UIViewController) {
    
    //create alert conrtroller
    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .Alert)
    
    //set cancel button title
    let cancelButton = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    
    //add button to alert controller
    alertController.addAction(cancelButton)
    
    //present the controller
    view.presentViewController(alertController, animated: true, completion: nil)
}


/**
 Calculates the overtime rate, overtime hours worked, gross pay, taxes, and net pay
 
 - Parameters:
    - payRate: The hourly rate of pay.
    - otRate: The multiplier applied to overtime hours.
    - hoursWorked: The number of hours worked.
    - taxRate: The total tax rate that applies to the income
    - other: Amount to take from pay for any other reason
 
 - Returns: 
    - otRate: The amount of money earned while working overtime.
    - otHours: The number of hours worked overtime.
    - gross: The gross amount of the paycheck.
    - totalTax: The amount of money taken from the paycheck due to taxes.
    - net: The amount the user's check will actually be.
*/
func calculateResults(payRate: Float, otRate: Float, hoursWorked: Int, taxRate: Float, other: Float) -> (otRate: Float, otHours: Int, gross: Float, totalTax: Float, net: Float) {
    
    //calculate overtime hourly rate
    let otRate = payRate * otRate
    
    //calculate number of OT hours worked
    let otHours: Int;
    if(hoursWorked > 40 ) {
        otHours = hoursWorked - 40
    } else {
        otHours = 0
    }
    
    //calculate gross pay
    let gross = Float(hoursWorked) * payRate + Float(otHours) * otRate
    
    //calculate taxes
    let totalTax = gross * taxRate
    
    //calculate net pay
    let net = gross - totalTax - other
    
    return(otRate, otHours, gross, totalTax, net)
}


/**
 Formats a number for output on screen
 
 - Parameter number: The number to be formatted.
 - Parameter style: The style to apply to number.
 
 - Returns: The formatted number as a String.
*/
func formatNumber(number: Float, style: NSNumberFormatterStyle) -> String! {
    let formatter = NSNumberFormatter()
    formatter.numberStyle = style
    
    return formatter.stringFromNumber(number)!
}

/**
 Displays the results on the screen
 
 - Parameter results: Tuple of the results from calculateResults()
 - Parameters:
    - otRateResults: Label for overtime rates
    - otHoursResults: Label for overtime hours
    - grossResult: Label for gross pay
    - totalTaxResult: Label for taxes on gross pay
    - netResult: Label for net pay
*/
func displayResults(results: (otRate: Float, otHours: Int, gross: Float, totalTax: Float, net: Float), otRateResult: UILabel, otHoursResult: UILabel, grossResult: UILabel, totalTaxesResult: UILabel, netResult: UILabel) {
    
    otRateResult.text = formatNumber(results.otRate, style: .CurrencyStyle)
    otHoursResult.text = String(results.otHours)
    grossResult.text = formatNumber(results.gross, style: .CurrencyStyle)
    totalTaxesResult.text = formatNumber(results.totalTax, style: .CurrencyStyle)
    netResult.text = formatNumber(results.net, style: .CurrencyStyle)
}

