//
//  UICollectionViewController+Extension.swift
//  UICommonKit
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation
import UIKit

extension UICollectionView {
    public static func createCollectionView(scrollDirection:ScrollDirection = .vertical) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        
        return collectionView
    }
}

