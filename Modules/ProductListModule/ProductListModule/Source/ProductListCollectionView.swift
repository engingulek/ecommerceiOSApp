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
    lazy var presenter : ViewToPresenterProductListProtocol = ProductListPresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        presenter.viewDidLoad()
      //  collectionView.backgroundColor = UIColor(hex: "#F6F5F5")
        
    }
}


//MARK: CollectionViewDelegate and CollectionViewDataSource
extension ProductListCollectionView {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, 
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier,
                                                            for: indexPath) as? ProductCVC 
        else {return UICollectionViewCell()}
        let baseProduct =  presenter.collectionViewCellForItem(at: indexPath)
        cell.setData(name: baseProduct.name, imageUrl: baseProduct.imageurl, price: baseProduct.price)
      
              
      
              
              
        cell.layer.cornerRadius = 5.0
        cell.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
              
        cell.layer.masksToBounds = true
        return cell
    }
}


//MARK: UICollectionViewDelegateFlowLayout
extension ProductListCollectionView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let cellWidth = (width-30) / 2
        return CGSize(width: cellWidth, height: cellWidth*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

//MARK: PresenterToViewProductListProtocol
extension ProductListCollectionView : PresenterToViewProductListProtocol {
 
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            collectionView.reloadData()
        }
    }
    
    
}
