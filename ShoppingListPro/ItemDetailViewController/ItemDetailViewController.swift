//
//  ItemDetailViewController.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

class ItemDetailViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Row>
    
    var item: Item
    private var dataSource: DataSource!
    
    init(item: Item) {
        self.item = item
        
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = UIColor(red: 0.78, green: 1, blue: 0.93, alpha: 1)
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)

        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initiate ItemDetailViewController with init(item:)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        
        updateSnapshot()
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = text(for: row)
        contentConfig.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        cell.contentConfiguration = contentConfig
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .viewName: return item.name
        }
    }
    
    private func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems([.viewName], toSection: 0)
        dataSource.apply(snapshot)
    }
    
}
