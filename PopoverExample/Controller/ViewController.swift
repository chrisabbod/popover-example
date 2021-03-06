//
//  ViewController.swift
//  PopoverExample
//
//  Created by Chris Abbod on 3/11/19.
//  Copyright © 2019 Chris Abbod. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showPopoverButtonAction(_ sender: Any) {
        //get the button frame
        let button = sender as? UIButton
        let buttonFrame = button?.frame ?? CGRect.zero
        
        //Configure the presentation controller
        let popoverStoryboard: UIStoryboard = UIStoryboard(name: "Popover", bundle: nil)
        let popoverContentController = popoverStoryboard.instantiateViewController(withIdentifier: "PopoverContentController") as? PopoverContentController
        popoverContentController?.modalPresentationStyle = .popover
        
        if let popoverPresentationController = popoverContentController?.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = buttonFrame
            popoverPresentationController.delegate = self
            /*Set the delegate */
            popoverContentController?.delegate = self
            
            if let popoverController = popoverContentController {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func showDatePopoverAction(_ sender: Any) {
        //get the button frame
        let button = sender as? UIBarButtonItem
        
        //Configure the presentation controller
        let popoverStoryboard: UIStoryboard = UIStoryboard(name: "Popover", bundle: nil)
        let jBDatePickerPopover = popoverStoryboard.instantiateViewController(withIdentifier: "JBDatePickerPopover") as? JBDatePickerPopover
        jBDatePickerPopover?.modalPresentationStyle = .popover
        
        if let popoverPresentationController = jBDatePickerPopover?.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.barButtonItem = button
            popoverPresentationController.delegate = self
            
            if let popoverController = jBDatePickerPopover {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func showUIDatePickerPopover(_ sender: UIBarButtonItem) {
        let button = sender
        
        let popoverStoryboard: UIStoryboard = UIStoryboard(name: "Popover", bundle: nil)
        let uiDatePickerPopover = popoverStoryboard.instantiateViewController(withIdentifier: "UIDatePickerPopover") as? UIDatePickerPopover
        uiDatePickerPopover?.modalPresentationStyle = .popover
        uiDatePickerPopover?.preferredContentSize = CGSize(width: 400, height: 400)
        
        if let popoverPresentationController = uiDatePickerPopover?.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.barButtonItem = button
            popoverPresentationController.delegate = self
            popoverPresentationController.backgroundColor = UIColor.gray
            
            if let popoverController = uiDatePickerPopover {
                present(popoverController, animated: true, completion: nil)
            }
        }
    }
    
    //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}

extension ViewController:PopoverContentControllerDelegate {
    func popoverContent(controller: PopoverContentController, didselectItem name: String) {
        
        showButton.setTitle(name, for: .normal)
    }
}
