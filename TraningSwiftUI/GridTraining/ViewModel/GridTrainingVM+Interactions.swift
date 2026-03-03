//
//  GridTrainingVM+Interactions.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import SwiftUI

extension GridViewModel {
    func getTextString(item: String) {
        print(item)
        selectedItem = "Selected Item \(item)"
        addItem(item: item)
    }

    func addItem(item: String) {
        addCardItem.append(Int(item) ?? 0)
        totalPayment = addCardItem.reduce(0) { $0 + $1 }
    }

    func removeItem(item: String) {
        addCardItem.removeAll(where: {$0 == Int(item)})
        totalPayment = addCardItem.reduce(0) { $0 + $1 }
    }
}
