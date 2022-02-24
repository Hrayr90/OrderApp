//
//  MenuItemDetaliViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import UIKit

class MenuItemDetaliViewController: UIViewController {
    
    @IBOutlet weak var nameLabale: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var detaliTextLable: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        nameLabale.text = menuItem.name
        priceLable.text = menuItem.price.formatted(.currency(code: "usd"))
        detaliTextLable.text = menuItem.detailText
    }

    let menuItem: MenuItem
    
    init?(coder: NSCoder, menuIteam: MenuItem) {
        self.menuItem = menuIteam
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
