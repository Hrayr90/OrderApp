//
//  CategoryTableViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    let menuController = MenuController()
    var categories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task.init {
            do {
                let categaries = try await menuController.fetchCategories()
                updateUI(with: categaries)
            } catch {
                displayError(error, title: "Failed to Fetch Categories")
            }
        }
    }

    func updateUI(with categories: [String]) {
        self.categories = categories
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error, title: String){
        guard let _ = viewIfLoaded?.window else { return }
        
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alert, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)

        configureCell(cell, forCategoryAt: indexPath)
        
        return cell
    }

    func configureCell(_ cell: UITableViewCell, forCategoryAt indexPath: IndexPath) {
        let categoty = categories[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = categoty.capitalized
        cell.contentConfiguration = content
    }
    
}
