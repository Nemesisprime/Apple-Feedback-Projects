//
//  BrokenSwiftUIListSelectionApp.swift
//  BrokenSwiftUIListSelection
//
//  Created by Daniel Griffin on 6/28/20.
//

import SwiftUI

@main
struct BrokenSwiftUIListSelectionApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Text("Using Tags")
                        }
                    )
                    NavigationLink(
                        destination: ListViewWithIDView(),
                        label: {
                            Text("Using ID")
                        }
                    )
                    NavigationLink(
                        destination: ListWithNavigationSelectionView(),
                        label: {
                            Text("Using NavigationLink Tag/Selection")
                        }
                    )
                }
                .listStyle(SidebarListStyle())
                Text(" - ")
                Text(" - ")
            }
        }
    }
}
