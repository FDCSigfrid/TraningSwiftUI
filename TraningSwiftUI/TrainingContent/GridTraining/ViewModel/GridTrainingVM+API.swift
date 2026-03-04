//
//  GridTrainingVM+API.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import Foundation

extension GridViewModel {
    func fetchProductList() {
        NetworkHelper().getAPI(
            url: "https://api.escuelajs.co/api/v1/products",
            params: [:]
        ) { response in
            self.isLoading = false
            
            switch response {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    if let products: [ProductItemDataModel] = try? jsonDecoder.decode(
                        [ProductItemDataModel].self,
                        from: data
                    ) {
                        self.allProductItem = products.filter { $0.id <= 27 }
                        self.allProductList.allProductList = self.allProductItem
                    }

                } catch {
                    debugPrint(error.localizedDescription)
                }

            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
