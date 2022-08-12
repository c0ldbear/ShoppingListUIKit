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
}
