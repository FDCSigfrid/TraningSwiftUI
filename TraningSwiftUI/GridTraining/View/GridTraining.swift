//
//  GridTraining.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import SwiftUI
import Combine

struct GridTraining: View {
    @StateObject private var viewModel: GridViewModel = .init()

    private var items: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                LazyVGrid(columns: items) {
                    ForEach(viewModel.allData, id: \.self) { item in
                        Text("\(item)")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(.red)
                            .shadow(radius: 5)
                            .onTapGesture {
                                viewModel.getTextString(item: "\(item)")
                            }
                    }
                }

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

            CommonLoadingUI(isLoading: $viewModel.isLoading)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewModel.fetchProductList()
            }
        }
    }
}

#Preview {
    GridTraining()
}
