//
//  GridTrainingVM+API.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import Foundation

extension GridViewModel {
    func fetchProductList() {
        allData = []

        for item in 1...15 {
            allData.append(item)
        }

        isLoading = false
    }
}
