//
//  SomeViewController.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

class ItemListViewController: UICollectionViewController {
    
    var items = Item.sampleData
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Item.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        setupNavigationItems()
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    @objc func lol() { print("TITLE button") }
    @objc func rightLol() { print("RIGHT button") }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = items[indexPath.item].id
        showItemDetail(for: id)
        return false
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true // Default is true, but want it here to know that this is possible to change
        listConfiguration.backgroundColor = UIColor(red: 0.05, green: 1, blue: 0, alpha: 0.05)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(items.map { $0.id })
        dataSource.apply(snapshot)
    }
    
    func showItemDetail(for id: Item.ID) {
        let item = item(for: id)
        let viewController = ItemDetailViewController(item: item)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupNavigationItems() {
        // Left side
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Title (middle)
//        let titleButton = UIButton(type: .custom)
//        titleButton.setImage(UIImage(systemName: "rectangle.stack"), for: .normal)
//        titleButton.addTarget(self, action: #selector(lol), for: .touchUpInside)
//        titleButton.clipsToBounds = true
//        titleButton.layer.cornerRadius = 4
//        titleButton.sizeToFit()
//        navigationItem.titleView = titleButton
        navigationItem.title = "Items"
        
        // Right side
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(UIImage(systemName: "plus"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightLol), for: .touchUpInside)
        rightButton.clipsToBounds = true
        rightButton.layer.cornerRadius = 4
        rightButton.sizeToFit()
        let rightButtonItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
}
