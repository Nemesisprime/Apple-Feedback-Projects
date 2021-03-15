//
//  ViewController.swift
//  NSHostingViewSizeInTableView
//
//  Created by Daniel Griffin on 3/14/21.
//

import Cocoa
import SwiftUI
import SnapKit

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!

    var dataSource: NSTableViewDiffableDataSource<Section, Item>!

    static let cellIdentifier = NSUserInterfaceItemIdentifier("TableCell")

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.usesAutomaticRowHeights = true
//        tableView.usesAutomaticRowHeights = false
//        tableView.rowHeight = 100

        dataSource = NSTableViewDiffableDataSource<Section, Item>(tableView: tableView) {
            [unowned self] (tableView, tableColumn, indexPath, item) -> NSView in

            guard let cell = tableView.makeView(withIdentifier: Self.cellIdentifier, owner: self) as? TableCell else {
                assertionFailure("Failed to create results cell")
                return NSView()
            }

            cell.configure(text: item.text)
            return cell
        }

        let items = [Item(text: "Nullam id dolor id nibh ultricies vehicula ut id elit."),
                     Item(text: "Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum."),
                     Item(text: "Donec sed odio dui. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."),
                     Item(text: "Aenean Pellentesque"),
                     Item(text: "Nulla vitae elit libero, a pharetra augue. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.")]

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

class TableCell: NSTableCellView {

    private var hasSetup = false

    // The inner
    private lazy var cellView: NSHostingView = {
        return NSHostingView(rootView: TableCellView(text: ""))
    }()

    /**
     Sets up da cell
     */
    private func setupCell() {
        guard !hasSetup else { return }
        hasSetup = true

        self.addSubview(cellView)

        cellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(text: String) {
        self.setupCell()
        self.cellView.rootView.text = text
    }
}

struct TableCellView: View {
    var text: String

    var body: some View {
        VStack(alignment: .center) {
            Text("Text:")
            Text("\(text)")
                .lineLimit(nil)
            // Without the fixedSize(...), text always truncates regardless of any modifiers. (Figure 1)
            // However, adding fixedSize on a view inside of NSHostingView causes the Hosting View to report
            // a size that doesn't match the View contained (Figure 2, Figure 3, Figure 4)
                .fixedSize(horizontal: false, vertical: true)
        }.frame(
            maxWidth: .infinity
        )
        .padding()
    }
}

enum Section: CaseIterable {
    case main
}

struct Item: Hashable {
    var text: String
}
