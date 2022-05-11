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

    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.1,
            options: [],
            animations: {
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        )

        MenuController.shared.order.menuItems.append(menuItem)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        nameLabale.text = menuItem.name
        priceLable.text = menuItem.price.formatted(.currency(code: "usd"))
        detaliTextLable.text = menuItem.detailText

        Task {
             if let image = try? await MenuController.shared.fetchImage(from: menuItem.imageURL) {
                 imageView.image = image
             }
         }
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
