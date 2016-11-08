//
//  CheckField.swift
//  PayMe
//
//  Created by Aaron Markey on 9/28/16.
//  Copyright © 2016 Aaron Markey. All rights reserved.
//

import UIKit

/**
 Struct that validates form input and converts it to correct data type
 */
struct ValidateField<T> {
    var getField: UITextField
    var getFieldDefault: String
    var failMessage: String
    var view: UIViewController
    var finalType: T
    
    init(field: UITextField, fieldDefault: String, message: String, fromView: UIViewController, type: T) {
        getField = field
        getFieldDefault = fieldDefault
        failMessage = message
        view = fromView
        finalType = type
    }
    
    /**
     Displays the results on the screen
     
     - Returns:
        - check: Field passed validation
        - float: Converted value if converted to Float
        - int: Converted value if converted to Int
     
     - Note: Tried using a proto on T and extending Float and Int. Could not get working, 
             so is now returning tuples until I can get working. This is a damn disaster.
     */
    func check() -> (check: Bool, float: Float, int: Int) {
        print("check")
        let text = getField.text!.isEmpty ? "0" : getField.text!
        if finalType is Float {
            if let v = Float(text) {
                conversionSuccessful(getField)
                if(v >= 0.0) {
                    return (true, v, 0)
                } else {
                    conversionFailure(failMessage, view: view, text: getField)
                    return (false, 0.0, 0)
                }
            } else {
                conversionFailure(failMessage, view: view, text: getField)
                return (false, 0.0, 0)
            }
        } else {
            if let v = Int(text) {
                conversionSuccessful(getField)
                if(v >= 0) {
                    return (true, 0.0, v)
                } else {
                    conversionFailure(failMessage, view: view, text: getField)
                    return (false, 0.0, 0)
                }
            } else {
                conversionFailure(failMessage, view: view, text: getField)
                return (false, 0.0, 0)
            }
        }

    }
}
