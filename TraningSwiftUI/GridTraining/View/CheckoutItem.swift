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
            LazyVGrid(columns: items) {
                ForEach(viewModel.addCardItem, id: \.self) { item in
                    Text("\(item)")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.red)
                        .shadow(radius: 5)
                        .onTapGesture {
                            viewModel.removeItem(item: "\(item)")
                        }
                }
            }

            Spacer()
                .frame(height: 30)
            Text(viewModel.addCardItem.map(String.init).joined(separator: " "))
                .background(.green)
        }
        .navigationTitle(
            Text("Checkout")
        )
    }
}

#Preview {
    CheckoutItem()
}
