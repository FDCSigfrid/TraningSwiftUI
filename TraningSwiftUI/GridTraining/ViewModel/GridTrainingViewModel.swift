//
//  Untitled.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import Foundation
import SwiftUI
import Combine

final class GridViewModel: ObservableObject {
    @Published var text: String = "Hello, World!"
    @Published var allData: [Int] = []
    @Published var isLoading: Bool = true

    @Published var selectedItem: String = ""
    @Published var addCardItem: [Int] = []

    @Published var totalPayment: Int = 0

    func testing() {
        print(2222)
    }
}

extension Int {
    func toDouble() -> Double {
        Double(self)
    }

    func deduct() -> Int {
        self - 1
    }
}
