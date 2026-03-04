//
//  GridTraining.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import SwiftUI
import Combine

struct GridTraining: View {
    @StateObject var viewModel: GridViewModel = .init()
    @State private var displayType: String = ""

    var items: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                Text("Display Type: \(displayType)")
                buttonDisplay
                itemVGrid
                checkOutButtonView
            }

            if displayType == "All" {
                testModal
                    .transition(.move(edge: .bottom))
            }

            CommonLoadingUI(isLoading: $viewModel.isLoading)
        }
        .onChange(of: viewModel.displayType) { value in
            withAnimation {
                displayType = value == 1 ? "All" : "Discount"
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if viewModel.isLoading {
                    viewModel.fetchProductList()
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                viewModel.displayType = 1
            }
        }
    }

    var testModal: some View {
        ZStack {
            Color.black.opacity(0.4)
                 .ignoresSafeArea()
                 .transition(.opacity)
                 .onTapGesture {
                     withAnimation {
                         displayType = "Discount"
                     }
                 }

            Text("SALE is starting now!")
                .foregroundStyle(.white)
                .font(.headline)
        }
    }

    var buttonDisplay: some View {
        HStack {
            Button {
                viewModel.allProductItem = viewModel.allProductList.discountedProduct
            } label: {
                Text("View Discounted Product")
            }
            .padding(.trailing, 25)

            Button {
                viewModel.allProductItem = viewModel.allProductList.allProductList
            } label: {
                Text("View All Product")
            }
        }
    }

    @ViewBuilder
    var checkOutButtonView: some View {
        if !viewModel.isLoading {
            Spacer()
                .frame(height: 50)
            Text(viewModel.selectedItem)

            Spacer()
                .frame(height: 20)
            Text(viewModel.addCardItem.map(String.init).joined(separator: " "))
                .background(.green)

            NavigationLink {
                CheckoutItem()
                    .environmentObject(viewModel)
            } label: {
                Text("CHECKOUT NOW")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(5)
            }

            Text("\(viewModel.totalPayment)")
                .onTapGesture {
                    viewModel.totalPayment = viewModel.totalPayment.deduct()
                }
        }
    }
}

#Preview {
    GridTraining()
}
