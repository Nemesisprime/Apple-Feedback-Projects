//
//  ContentView.swift
//  BrokenSwiftUIListSelection
//
//  Created by Daniel Griffin on 6/28/20.
//

import SwiftUI
import Combine

class ListWithNavigationSelectionViewModel: ObservableObject {

    @Published var selection: Int? = 0

    var cancelBag = Set<AnyCancellable>()

    init() {
        self.$selection.sink(receiveValue: { value in
            print("By NavLink: Updated Selection Value: \(value)")
        })
        .store(in: &cancelBag)
    }
}

struct ListWithNavigationSelectionView: View {

    @StateObject var viewModel = ListWithNavigationSelectionViewModel()

    var body: some View {
//        List(selection: $viewModel.selection)  {
        List {
            NavigationLink(
                destination: Text("Detail"),
                tag: 0,
                selection: $viewModel.selection) {
                Text("Line 0")
            }

            NavigationLink(
                destination: Text("Detail"),
                tag: 1,
                selection: $viewModel.selection) {
                Text("Line 1")
            }

            NavigationLink(
                destination: Text("Detail"),
                tag: 2,
                selection: $viewModel.selection) {
                Text("Line 2")
            }

            NavigationLink(
                destination: Text("Detail"),
                tag: 3,
                selection: $viewModel.selection) {
                Text("Line 3")
            }
        }
    }
}

struct ListWithNavigationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
