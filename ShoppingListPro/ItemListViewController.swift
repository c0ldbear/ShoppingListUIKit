//
//  SomeViewController.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

class ItemListViewController: UICollectionViewController {
    
    var items = Item.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        listLayout()
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
