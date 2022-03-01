//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 28.02.22.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    @IBOutlet var confirmationLabel: UILabel!
    
    let minutesToPrepare: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmationLabel.text = "Thank you for your order! Your wait time is approximately \(minutesToPrepare) minutes."
    }
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
