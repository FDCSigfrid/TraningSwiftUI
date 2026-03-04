//
//  CheckoutItem.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import SwiftUI

struct CheckoutItem: View {
    @EnvironmentObject var viewModel: GridViewModel

    private var items: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            itemVGrid

            Spacer()
                .frame(height: 30)
            Text(viewModel.addCardItem.map(String.init).joined(separator: " "))
                .background(.green)

            Text("Total Amount: \(viewModel.addCartItemV2.totalAmount)")
        }
        .navigationTitle(
            Text("Checkout")
        )
    }

    var itemVGrid: some View {
        LazyVGrid(columns: items) {
            ForEach(viewModel.addCartItemV2.allProductList, id: \.id) { item in
                productImage(imageURL: item.images[0], item: item)
                    .onTapGesture {
                        viewModel.removeItem(item: item)
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
                    .frame(width: .infinity)
            }
            .padding(.bottom, 2)

        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CheckoutItem()
}
