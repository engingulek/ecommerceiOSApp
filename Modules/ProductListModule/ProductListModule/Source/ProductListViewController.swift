//
//  ProductListCollectionView.swift
//  ProductListModule
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UICommonKit
import UIKit
final class ProductListCollectionView :UIViewController {
    lazy var presenter : ViewToPresenterProductListProtocol = ProductListPresenter(view: self,
                                                                                   interactor: ProductListInteractor(),
                                                                                   router: ProductListRouter())
    
    private lazy var productListCollectionView = UICollectionView.createCollectionView(scrollDirection: .vertical)
    private lazy var searchTextField = UISearchTextField()
    private lazy var emptyMessageLabel = UILabel.primaryUILabelLeft(color: ColorTheme.alertLabelColor.rawValue)
    
    private lazy var loadingIndicator = UIActivityIndicatorView.createActivityIndicator()
    
    //TODO: ActivityIndicator will be added there
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productListCollectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        let sortButton = UIBarButtonItem(title: TextTheme.sort.rawValue ,
                                         style: .plain, target: self,
                                         action: #selector(sortButtonTapped))
        
        self.navigationItem.rightBarButtonItem = sortButton
        presenter.viewDidLoad()
        
        productListCollectionView.register(ProductCVC.self, forCellWithReuseIdentifier: ProductCVC.identifier)
        //TODO: Look at the best of this
        searchTextField.addTarget(self,
                                  action: #selector(searchTextFieldDidChange(_:)),
                                  for: .editingChanged)
        
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
        
        view.addSubview(productListCollectionView)
        productListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(emptyMessageLabel)
        emptyMessageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    
    @objc func searchTextFieldDidChange(_ textField: UITextField){
        presenter.searchProductList(searchText: searchTextField.text)
        
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
extension ProductListCollectionView : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfItemsInSection()
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(at: indexPath)
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
            productListCollectionView.reloadData()
        }
    }
    
    func prepareCollectionView() {
        productListCollectionView.delegate = self
        productListCollectionView.dataSource = self
    }
    
    func searchTextFieldPlacholder(placholderText: String) {
        searchTextField.placeholder = placholderText
    }
    
    func setEmptyMessageForYou(text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            emptyMessageLabel.text = text
        }
    }
    
    func startIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            loadingIndicator.startAnimating()
        }
    }
    
    func stopIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            loadingIndicator.stopAnimating()
        }
    }
    
}

