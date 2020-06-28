//
//  ContentView.swift
//  BrokenSwiftUIListSelection
//
//  Created by Daniel Griffin on 6/28/20.
//

import SwiftUI
import Combine


class ListViewWithIDViewModel: ObservableObject {

    var nums = [0, 1, 2]

    @Published var selection: Int? = 0

    var cancelBag = Set<AnyCancellable>()

    init() {
        self.$selection.sink(receiveValue: { value in
            print("By ID: Updated Selection Value: \(value)")
        })
        .store(in: &cancelBag)
    }
}

struct ListViewWithIDView: View {

    @StateObject var viewModel = ListViewWithIDViewModel()

    var body: some View {
        List(viewModel.nums, selection: $viewModel.selection) { num in
            NavigationLink(destination: Text("Detail")) {
                Text("Line \(num)")
            }.tag(num)
        }
    }
}

extension Int: Identifiable {
    public var id: Int {
        return self
    }
}

struct ListViewWithIDView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewWithIDView()
    }
}
