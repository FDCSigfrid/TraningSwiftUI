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
    }

    func addItem(item: ProductItemDataModel) {
        addCartItemV2.allProductList.append(item)
    }

    func removeItem(item: ProductItemDataModel) {
        if let index = allProductItem.firstIndex(where: {$0.id == item.id }) {
            allProductItem[index].isSelected = false
        }
        addCartItemV2.allProductList.removeAll(where: {$0.id == item.id })
    }
}
