//
//  ViewController.swift
//  Ejercicio-UIKit
//
//  Created by Alejandro Hernandez on 15/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var itemsTable: UITableView!
    private var items: Items = []
    private let viewModel = ItemsViewModel()
    private let cellHeight: CGFloat = 70

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        itemsTable.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: ItemCell.reuserIdentifier)
        itemsTable.dataSource = self
        itemsTable.delegate = self
        itemsTable.allowsSelection = false
        viewModel.itemDelegate = self
        viewModel.fetchItems()
    }
    
    
}

extension ViewController: ItemDelegate {
    func reload() {
        self.itemsTable.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuserIdentifier) as? ItemCell else { return UITableViewCell() }
        cell.titleLable.text = viewModel.items[indexPath.row].title
        cell.userIdLabel.text = "User id: \(viewModel.items[indexPath.row].userId)"
        if viewModel.items[indexPath.row].completed {
            cell.completedImageView.image = UIImage(systemName: completedTask)
            cell.completedImageView.tintColor = .systemGreen
        } else {
            cell.completedImageView.image = UIImage(systemName: notCompletedTask)
            cell.completedImageView.tintColor = .systemRed
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

