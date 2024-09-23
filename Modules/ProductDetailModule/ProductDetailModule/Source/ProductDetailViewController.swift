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

    private lazy var productImagesCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductImagesCVC.self, forCellWithReuseIdentifier: ProductImagesCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        collectionView.tag = 0
        
        return collectionView
    }()
    
    
    private lazy var featureOneCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PDFeatureOneCVC.self, forCellWithReuseIdentifier: PDFeatureOneCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        collectionView.tag = 1
        
        return collectionView
    }()
    
    private lazy var featureTwoCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PDFeatureOneCVC.self, forCellWithReuseIdentifier: PDFeatureOneCVC.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        collectionView.tag = 2
        
        return collectionView
    }()
    private lazy var baseProductImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "iphone")
        return imageView
    }()
    
    private lazy var productName : UILabel = {
        let label = UILabel()
        label.text = "iPhone 13 256GB Black"
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descTitle : UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = FontTheme.font.secondaryFontBoldVersion
        label.textColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        label.textAlignment = .left
        return label
    }()
    private lazy var productDesc : UILabel = {
        let label = UILabel()
        label.text = "Experience the ultimate in portability and performance with the MacBook Air M1. Featuring a 13.3-inch Retina display, Apple M1 chip for lightning-fast speeds, and a sleek, lightweight design."
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var productPrice : UILabel = {
        let label = UILabel()
        label.text = "1220"
        label.font = FontTheme.font.secondaryFontBoldVersion
        label.textColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    
    
    private lazy var featureOneTitle : UILabel = {
        let label = UILabel()
        label.text = "Size"
        label.font = FontTheme.font.primaryFontBoldVersion
        label.textColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    
    
    private lazy var featureTwoTitle : UILabel = {
        let label = UILabel()
        label.text = "Color"
        label.font = FontTheme.font.primaryFontBoldVersion
        label.textColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        label.textAlignment = .left
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.viewDidLoad()
        
    }
    
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
        switch collectionView.tag{
        case 0 :
            return 3
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag{
        case 0 :
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImagesCVC.identifier, for: indexPath) as? ProductImagesCVC else {return UICollectionViewCell()}
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PDFeatureOneCVC.identifier, for: indexPath) as? PDFeatureOneCVC else {return UICollectionViewCell()}
            cell.setData(text: "256GB")
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PDFeatureOneCVC.identifier, for: indexPath) as? PDFeatureOneCVC else {return UICollectionViewCell()}
            cell.setData(text: "Black")
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
