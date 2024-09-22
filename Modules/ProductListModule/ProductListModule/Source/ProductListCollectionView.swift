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
    //TODO: ActivityIndicator will be added there
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        let sortButton = UIBarButtonItem(title: TextTheme.sort.rawValue , 
                                         style: .plain, target: self,
                                         action: #selector(sortButtonTapped))
        
        self.navigationItem.rightBarButtonItem = sortButton
        presenter.viewDidLoad()
    }
    
    @objc private func sortButtonTapped(){
        let alert = UIAlertController(title: TextTheme.sort.rawValue, 
                                      message: TextTheme.sortType.rawValue,
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: TextTheme.ascendingPrice.rawValue, style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            presenter.sortAscendingPrice()
        }))
        
        alert.addAction(UIAlertAction(title: TextTheme.descendingPrice.rawValue, style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            presenter.sortDescendingPrice()
        }))
        
        alert.addAction(UIAlertAction(title: TextTheme.cancel.rawValue, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
        
        let cellItem =  presenter.collectionViewCellForItem(at: indexPath)
        let baseProduct = cellItem.product
        
        cell.setData(name: baseProduct.name, imageUrl: baseProduct.imageurl, price: baseProduct.price)
        cell.layer.cornerRadius = cellItem.radius
        cell.backgroundColor = UIColor(hex: cellItem.backColor)
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let item = presenter.insetForSectionAt()
        
        return UIEdgeInsets(top: item.top, left: item.left, bottom: item.bottom, right: item.right)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return presenter.minimumLineSpacingForSectionAt()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return presenter.minimumInteritemSpacingForSectionAt()
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
