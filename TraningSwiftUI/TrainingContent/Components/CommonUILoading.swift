//
//  CommonUILoading.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/3/26.
//

import SwiftUI

struct CommonLoadingUI: View {
    @Binding var isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView()
                .tint(.white)
                .scaleEffect(2.5)
                .progressViewStyle(CircularProgressViewStyle())
                .padding(30)
                .background(.secondary)
                .shadow(radius: 15)
                .cornerRadius(12)
        }
    }
}
