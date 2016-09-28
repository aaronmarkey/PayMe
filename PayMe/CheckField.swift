//
//  CheckField.swift
//  PayMe
//
//  Created by Aaron Markey on 9/28/16.
//  Copyright © 2016 Aaron Markey. All rights reserved.
//

import UIKit

protocol Init {
    init(_:String)
}

struct CheckField<T:Init> {
    var getField: UITextField
    var getFieldDefault: String
    var setFieldType: T.Type
    var failMessage: String
    var view: UIViewController
    
    init(field: UITextField, fieldDefault: String, type: T.Type, message: String, fromView: UIViewController) {
        getField = field
        getFieldDefault = fieldDefault
        failMessage = message
        view = fromView
        setFieldType = type
    }
    
    
    func checkAndConvert(type: T) -> Bool {
        
        getField.text = getField.text!.isEmpty ? "0" : getField.text
        if let v = convertToType(getField.text!, type: type) {
            conversionSuccessful(v, text: getField)
            return true
        } else {
            conversionFailure(failMessage, view: view, text: getField)
            return false
        }
    }
    
    func convertToType(value: String, type: T) -> T? {
        return T(value)
    }
}

