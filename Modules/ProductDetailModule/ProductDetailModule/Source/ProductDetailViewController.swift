//
//  ProductDetailViewController.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import UIKit
import SnapKit
import UICommonKit
class ProductDetailViewController: UIViewController {
    lazy var presenter : ViewToPresenterProductDetailProtocol = ProductDetailPresenter(view: self)

    private lazy var productImagesCollectionView  = UICollectionView.createCollectionView(scrollDirection: .horizontal,tag: 0)
    private lazy var featureOneCollectionView  = UICollectionView.createCollectionView(scrollDirection: .horizontal,tag: 1)
    private lazy var featureTwoCollectionView = UICollectionView.createCollectionView(scrollDirection: .horizontal,tag: 2)
    


    private lazy var baseProductImageView = UIImageView.primaryImageView()
    
    private lazy var productName = UILabel.secondaryLabel(numnerOfLines: 2)
    
    private lazy var descTitle = UILabel.primaryUILabelLeft(text: TextTheme.description.rawValue)
    
    private lazy var productDesc = UILabel.secondaryLabel(numnerOfLines: 3)
    
    private lazy var productPrice = UILabel.primaryUILabelLeft()
    
    
    
    private lazy var featureOneTitle = UILabel.primaryUILabelLeft(text: TextTheme.size.rawValue)
    
    
    
    private lazy var featureTwoTitle = UILabel.primaryUILabelLeft(text: TextTheme.color.rawValue)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewDidLoad()
        productImagesCollectionView.register(ProductImagesCVC.self, forCellWithReuseIdentifier: ProductImagesCVC.identifier)
        featureOneCollectionView.register(PDFeatureOneCVC.self, forCellWithReuseIdentifier: PDFeatureOneCVC.identifier)
        featureTwoCollectionView.register(PDFeatureOneCVC.self, forCellWithReuseIdentifier: PDFeatureOneCVC.identifier)
        
    }
    
    //MARK: ConfigureUI
    private func configureUI() {
    
        view.addSubview(baseProductImageView)
        baseProductImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 3)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        view.addSubview(productImagesCollectionView)
        productImagesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(baseProductImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width / 1.5)
            make.height.equalTo(80)
        }
        view.addSubview(productName)
        productName.snp.makeConstraints { make in
            make.top.equalTo(productImagesCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(productPrice)
        productPrice.snp.makeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            
        }
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(productPrice.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        view.addSubview(productDesc)
        productDesc.snp.makeConstraints { make in
            make.top.equalTo(descTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(featureOneTitle)
        featureOneTitle.snp.makeConstraints { make in
            make.top.equalTo(productDesc.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(featureOneCollectionView)
        featureOneCollectionView.snp.makeConstraints { make in
            make.top.equalTo(featureOneTitle.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(featureTwoTitle)
        featureTwoTitle.snp.makeConstraints { make in
            make.top.equalTo(featureOneCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        
        view.addSubview(featureTwoCollectionView)
        featureTwoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(featureTwoTitle.snp.bottom).offset(10)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        
    }
}

//MARK:  PresenterToViewProductDetailProtocol
extension ProductDetailViewController : PresenterToViewProductDetailProtocol {
    func prepareCollectionView() {
        productImagesCollectionView.delegate = self
        productImagesCollectionView.dataSource = self
        //TODO: A separate one will be created for this
        featureOneCollectionView.delegate = self
        featureOneCollectionView.dataSource = self
        
        //TODO: A separate one will be created for this
        featureTwoCollectionView.delegate = self
        featureTwoCollectionView.dataSource = self
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            productImagesCollectionView.reloadData()
            //TODO: A separate one will be created for this
            featureOneCollectionView.reloadData()
            //TODO: A separate one will be created for this
            featureTwoCollectionView.reloadData()
        }
    }
}

//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension ProductDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  presenter.numberOfItemsInSection(tag: collectionView.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 0 :
           guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductImagesCVC.identifier,
            for: indexPath) as? ProductImagesCVC else {return UICollectionViewCell()}
            let item = presenter.collectionViewCellForItem(at: indexPath, tag: 0)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PDFeatureOneCVC.identifier,
                for: indexPath) as? PDFeatureOneCVC else {return UICollectionViewCell()}
            let item = presenter.collectionViewCellForItem(at: indexPath, tag: 1)
            print(item.text)
            cell.setData(text: item.text)
            cell.setUI()
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PDFeatureOneCVC.identifier,
                for: indexPath) as? PDFeatureOneCVC else {return UICollectionViewCell()}
            let item = presenter.collectionViewCellForItem(at: indexPath, tag: 2)
            cell.setData(text: item.text)
            cell.setUI()
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


extension ProductDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 50)
    }
}
