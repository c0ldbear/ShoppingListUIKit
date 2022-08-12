//
//  Items.swift
//  ShoppingListPro
//
//  Created by teddy juhlin-henricson on 2022-08-12.
//

import Foundation

struct Item {
    var name: String
}

#if DEBUG
extension Item {
    static var sampleData: [Item] {
        return [
            Item(name: "Sepsi"),                // Pepsi
            Item(name: "Sepsi Sax"),            // Pepsi Max
            Item(name: "Soca Sola"),            // Coca Cola
            Item(name: "Sonic water"),
            Item(name: "Sr Sepper"),
            Item(name: "Sarlsberg"),
            Item(name: "Sulmust"),
            Item(name: "Santa 🎅"),
            Item(name: "Stn Sew"),              // Mountain Dew - ???
            Item(name: "S-up"),
        ]
    }
}
#endif
