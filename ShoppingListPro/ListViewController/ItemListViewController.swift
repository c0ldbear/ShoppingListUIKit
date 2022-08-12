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
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Item.sampleData.map { $0.name })
        dataSource.apply(snapshot)
    }
}
