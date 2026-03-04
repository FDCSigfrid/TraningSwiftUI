//
//  GridTraining+Product.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/4/26.
//

import SwiftUI

extension GridTraining {
    var itemVGrid: some View {
        LazyVGrid(columns: items) {
            ForEach(0..<viewModel.allProductItem.count, id: \.self) { index in
                productImage(
                    imageURL: viewModel.allProductItem[index].images[0],
                    item: viewModel.allProductItem[index]
                )
                .onTapGesture {
                    let isSelected = viewModel.allProductItem[index].isSelected ?? false
                    if !isSelected {
                        viewModel.allProductItem[index].isSelected = true
                        viewModel.addItem(item: viewModel.allProductItem[index])
                    } else {
                        viewModel.allProductItem[index].isSelected = false
                        viewModel.removeItem(item: viewModel.allProductItem[index])
                    }
                }
            }
        }
    }

    func productImage(imageURL: String, item: ProductItemDataModel) -> some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            ZStack(alignment: .bottom) {
                image
                    .resizable()
                    .scaledToFit()

                VStack {
                    HStack {
                        Spacer()

                        Text("\(Int(discountPercentage * 100))%")
                            .font(.system(size: 12))
                            .padding(5)
                            .background(.black.opacity(0.35))
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }

                Text(item.priceString)
                    .padding(5)
                    .background(.black.opacity(0.35))
                    .foregroundStyle(.white)

                // Overlay when selected
                if item.isSelected == true {
                    Color.black.opacity(0.4)
                        .cornerRadius(12)

                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 1)

        } placeholder: {
            ProgressView()
        }
    }
}
