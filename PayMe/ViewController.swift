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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

