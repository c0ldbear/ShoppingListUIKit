//
//  ItemListViewController+DataSource.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

extension ItemListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Item.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Item.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Item.ID) {
        let item = item(for: id)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = item.name
        cell.contentConfiguration = contentConfig
    }
    
    func item(for id: Item.ID) -> Item {
        let index = items.indexOf(for: id)
        return items[index]
    }
   
    func update(_ item: Item, with id: Item.ID) {
        let index = items.indexOf(for: id)
        items[index] = item
    }
}
