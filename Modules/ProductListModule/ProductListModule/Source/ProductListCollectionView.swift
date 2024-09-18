//
//  ProductListCollectionView.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UICommonKit
import UIKit
final class ProductListCollectionView : BaseCollectionView {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        collectionView.reloadData()
    }
}


//MARK: CollectionViewDelegate and CollectionViewDataSource
extension ProductListCollectionView {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier, for: indexPath) as? ProductCVC else {return UICollectionViewCell()}
        return cell
    }
}


extension ProductListCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let cellWidth = (width-30) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
