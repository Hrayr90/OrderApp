//
//  MenuTableViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let category: String
    
    init?(coder: NSCoder, category: String) {
        self.category = category
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
