//
//  ScrollView.swift
//  PayMe
//
//  Created by Aaron Markey on 11/7/16.
//  Copyright © 2016 Aaron Markey. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

}
