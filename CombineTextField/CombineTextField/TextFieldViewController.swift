//
//  ViewController.swift
//  CombineTextField
//
//  Created by Asaad Jaber on 11/08/2025.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    enum Section: Int, CaseIterable {
        case textField
        case receiver
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = createLayout()
        createDataSource()
        applySnapshot()
    }

    enum Item {
        case textFieldItem
        case receiverItem
    }
    
    /// The data source which is responsible for providing the items.

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    /// Layout code that renders the compositional layout.
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .estimated(80))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .estimated(80))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(80))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .topLeading)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.boundarySupplementaryItems = [header]
            
            return section
        }
        return layout
    }
    
    /// Creating the data source and configuring the text field and receiver item cells
    
    func createDataSource() {
    
        let textFieldCellRegistration = UICollectionView.CellRegistration<TextFieldCell, Item> { cell, indexPath, item in
            
        }
        
        let receiverItemCellRegistration = UICollectionView.CellRegistration<ReceiverItemCell, Item> { cell, indexPath, item in
            
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<UICollectionViewListCell>(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            var content = supplementaryView.defaultContentConfiguration()
            
            if indexPath.section == 0 {
                content.text = "Combine Text Field"
            } else {
                content.text = "Combine Receiver"
            }
            
            supplementaryView.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { collectionView, indexPath, item in
            
            if indexPath.section == 0 {
                let cell = collectionView.dequeueConfiguredReusableCell(using: textFieldCellRegistration,
                                                                        for: indexPath,
                                                                        item: item)
                return cell
            } else {
                let cell = collectionView.dequeueConfiguredReusableCell(using: receiverItemCellRegistration,
                                                                        for: indexPath,
                                                                        item: item)
                return cell
            }
        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
    }
    
    /// Applying the data sourec snapshot which loads the initial collection view
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.textField, .receiver])
        snapshot.appendItems([Item.textFieldItem], toSection: .textField)
        snapshot.appendItems([Item.receiverItem], toSection: .receiver)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

