//
//  UICollectionViewController+Extension.swift
//  UICommonKit
//
//  Created by Engin Gülek on 22.09.2024.
//

import Foundation
import UIKit

extension UICollectionView {
    public static func createCollectionView(scrollDirection:ScrollDirection,tag:Int = 0) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.tag = tag
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        
        return collectionView
    }
}

