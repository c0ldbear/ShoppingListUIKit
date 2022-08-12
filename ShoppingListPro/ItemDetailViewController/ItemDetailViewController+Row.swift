//
//  ItemDetailViewController+Row.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import UIKit

extension ItemDetailViewController {
    enum Row {
        case viewName
        
        var textStyle: UIFont.TextStyle {
            // Return .headline but usually use a switch-case to set for each case
            return .headline
        }
    }
}
