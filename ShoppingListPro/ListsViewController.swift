//
//  ViewController.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-10.
//

import UIKit

class ListsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        setupNavigationBarItems()
    }

    private func setupNavigationBarItems() {
        navigationItem.leftBarButtonItem = editButtonItem
        
        // add '+' sign to for adding new stuff?
        let addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(lol), for: .touchUpInside)
        addButton.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    @objc private func lol() {
        print("ADD ITEMS SELECTION FROM LIST")
    }
    
}

