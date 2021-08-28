//
//  ViewController.swift
//  UIHostingFocusCrash
//
//  Created by Daniel Griffin on 8/24/21.
//

import UIKit
import SwiftUI

// MARK: - Primary UIKit Controller

class ViewController: UIViewController {
    
    static let cellID = "ExampleCellID"
    static let items = [Item(text: "Nullam id dolor id nibh ultricies vehicula ut id elit."),
                        Item(text: "Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum."),
                        Item(text: "Donec sed odio dui. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."),
                        Item(text: "Aenean Pellentesque"),
                        Item(text: "Nulla vitae elit libero, a pharetra augue. Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.")]

    @IBOutlet weak var collectionView: UICollectionView!
        
    var hasPressedRemoveAllButton = false
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // MARK: View Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellRegistration = UICollectionView.CellRegistration<TableCell, Item> { [weak self] (cell, indexPath, item) in
            cell.parent = self
            cell.configure(item.text)
        }
        
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: config)
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {
            collectionView, indexPath, item in
            return self.collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(Self.items, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    @IBAction func didPressRemoveItemsButton(_ sender: Any) {
        // Remove all items
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

class TableCell: UICollectionViewListCell {
    
    private var hasSetup = false
    
    private lazy var cellView: UIHostingController = {
        return UIHostingController<TableCellView>(rootView: TableCellView(text: ""))
    }()
    
   public weak var parent: UIViewController?
    
    /**
     Sets up da cell
     */
    private func setupCell() {
        guard !hasSetup else { return }
        hasSetup = true

        self.addSubview(cellView.view)
        
        if let parent = parent {
            parent.addChild(cellView)
            cellView.didMove(toParent: parent)
        }
        
        cellView.view.backgroundColor = .clear
        cellView.view.translatesAutoresizingMaskIntoConstraints = false
        cellView.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        cellView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        cellView.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        cellView.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    func configure(_ text: String) {
        setupCell()
        
        self.cellView.rootView.text = text
    }
}


struct TableCellView: View {
    var text: String

    var body: some View {
        VStack(alignment: .center) {
            Text("Text:")
            Text(text)
                .lineLimit(nil)
        }
        .frame(
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


// MARK: - Secondary SwiftUI Controller

class YoloViewController: UIHostingController<YoloView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: YoloView())
    }
}

struct YoloView: View {
    var body: some View {
        Text("Yolo View")
    }
}
