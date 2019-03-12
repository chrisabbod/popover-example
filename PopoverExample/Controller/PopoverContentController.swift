//
//  PopoverContentController.swift
//  PopoverExample
//
//  Created by Chris Abbod on 3/11/19.
//  Copyright © 2019 Chris Abbod. All rights reserved.
//

import UIKit

//Protocol Declaration
protocol PopoverContentControllerDelegate:class {
    func popoverContent(controller:PopoverContentController, didselectItem name:String)
}
//End Protocol

class PopoverContentController:UIViewController {
    let datasourceArray = ["Car", "Bike", "Bus", "Van", "bicycle"]
    static let CELL_REUSE_ID = "POPOVER_CELL_REUSE_ID"
    var delegate:PopoverContentControllerDelegate? //declare a delegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PopoverContentController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: PopoverContentController.CELL_REUSE_ID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: PopoverContentController.CELL_REUSE_ID)
        }
        cell?.textLabel?.text = datasourceArray[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    //MARK: Tableview Delegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVehicle = datasourceArray[indexPath.row]
        self.delegate?.popoverContent(controller: self, didselectItem: selectedVehicle)
        self.dismiss(animated: true, completion: nil)
    }
}
