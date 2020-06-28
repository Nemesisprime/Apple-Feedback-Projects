//
//  ContentView.swift
//  BrokenSwiftUIListSelection
//
//  Created by Daniel Griffin on 6/28/20.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {

    @Published var selection: Int? = 0

    var cancelBag = Set<AnyCancellable>()

    init() {
        self.$selection.sink(receiveValue: { value in
            print("By Tag: Updated Selection Value: \(value)")
        })
        .store(in: &cancelBag)
    }
}

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        List(selection: $viewModel.selection)  {
            NavigationLink(destination: Text("Detail")) {
                Text("Line 0")
            }.tag(0)

            NavigationLink(destination: Text("Detail")) {
                Text("Line 1")
            }.tag(1)

            NavigationLink(destination: Text("Detail")) {
                Text("Line 2")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
