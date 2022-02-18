//
//  MenuItemDetaliViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import UIKit

class MenuItemDetaliViewController: UIViewController {

    let menuItem: MenuItem
    
    init?(coder: NSCoder, menuIteam: MenuItem) {
        self.menuItem = menuIteam
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
