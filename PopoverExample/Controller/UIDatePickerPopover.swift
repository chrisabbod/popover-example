//
//  UIDatePickerPopover.swift
//  PopoverExample
//
//  Created by Chris Abbod on 3/12/19.
//  Copyright © 2019 Chris Abbod. All rights reserved.
//

import UIKit

class UIDatePickerPopover: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func selectDateButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
