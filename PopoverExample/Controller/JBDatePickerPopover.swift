//
//  JBDatePickerPopover.swift
//  PopoverExample
//
//  Created by Chris Abbod on 3/12/19.
//  Copyright © 2019 Chris Abbod. All rights reserved.
//

import UIKit
import JBDatePicker

class JBDatePickerPopover: ViewController, JBDatePickerViewDelegate {
   
    @IBOutlet var datePicker: JBDatePickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.delegate = self
    }
    
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(String(describing: dayView.date))")
    }
    
}
