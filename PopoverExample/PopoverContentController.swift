//
//  PopoverContentController.swift
//  PopoverExample
//
//  Created by Chris Abbod on 3/11/19.
//  Copyright © 2019 Chris Abbod. All rights reserved.
//

import UIKit

class PopoverContentController: UIViewController {
    
    let datasourceArray = ["Car", "Bike", "Bus", "Van", "bicycle"]
    static let CELL_REUSE_ID = "POPOVER_CELL_REUSE_ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
}
