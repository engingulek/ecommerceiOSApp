//
//  BaseCollectionView.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

import UIKit
//TODO: This will be moved to Kits
class BaseCollectionView : UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
