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
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { [weak self] (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item.text
            cell.contentConfiguration = content
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
        Text("Empty SwiftUI View")
    }
}
