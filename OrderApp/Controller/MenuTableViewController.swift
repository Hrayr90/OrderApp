//
//  MenuTableViewController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var imageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    let category: String
    var menuItems = [MenuItem]()
    init?(coder: NSCoder, category: String) {
        self.category = category
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.capitalized

        Task.init {
            do {
                let menuItems = try await MenuController.shared.fetchMenuItams(forCategary: category)
                updateUI(with: menuItems)
            } catch {
                displayError(error, title: "Failed to Fetch Menu Items for \(self.category)")
            }
        }
    }

    override func tableView(
        _ tableView: UITableView,
        didEndDisplaying cell: UITableViewCell,
        forRowAt indexPath: IndexPath) {
        imageLoadTasks[indexPath]?.cancel()
    }

    func updateUI(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        self.tableView.reloadData()
    }

    func displayError(_ error: Error, title: String) {
        guard viewIfLoaded?.window != nil else { return }

        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))

        self.present(alert, animated: true)
    }

    @IBSegueAction func showMenuItem(_ coder: NSCoder, sender: Any?) -> MenuItemDetaliViewController? {

        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return nil }

        let menuItem = menuItems[indexPath.row]

        return MenuItemDetaliViewController(coder: coder, menuIteam: menuItem)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageLoadTasks.forEach { _, value in value.cancel() }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath)
        configure(cell, forIteamAt: indexPath)
        return cell
    }

    func configure(_ cell: UITableViewCell, forIteamAt indexPath: IndexPath) {
        guard let cell = cell as? MenuItemCell else { return }

        let menuItem = menuItems[indexPath.row]

        cell.itemName = menuItem.name
        cell.price = menuItem.price
        cell.image = nil
        imageLoadTasks[indexPath] = Task {
            if let image = try? await MenuController.shared.fetchImage(from: menuItem.imageURL) {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath == indexPath {
                    cell.image = image
                }
            }
            imageLoadTasks[indexPath] = nil
        }
    }
}
