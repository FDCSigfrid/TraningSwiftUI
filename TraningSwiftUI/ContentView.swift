//
//  ContentView.swift
//  TraningSwiftUI
//
//  Created by Sigfri on 3/2/26.
//

import SwiftUI
import Combine

struct ContentView: View {

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to SwiftUI Traning")
                GridTraining()
            }
        }
    }
}

#Preview {
    ContentView()
}
