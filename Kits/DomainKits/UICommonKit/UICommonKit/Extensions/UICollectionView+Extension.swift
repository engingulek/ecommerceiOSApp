//
//  UICollectionViewController+Extension.swift
//  UICommonKit
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation
import UIKit

extension UICollectionView {
   public static func createCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        
        return collectionView
    }
}

