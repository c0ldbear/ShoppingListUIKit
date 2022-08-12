//
//  ItemListViewController+DataSource.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

extension ItemListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) {
        let item = Item.sampleData[indexPath.item]
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = item.name
        cell.contentConfiguration = contentConfig
    }
}
