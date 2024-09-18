//
//  ProductCVC.swift
//  UICommonKit
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation
import UIKit
import SnapKit



public final class ProductCVC : UICollectionViewCell {
    public static let identifier : String = "productCVC"
    
    private lazy var productImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "iphone")
        return imageView
    }()
    
    
    private lazy var productName : UILabel = {
        let label = UILabel()
        label.text = "iPhone 13 256GB Black"
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = .zero
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            
            make.height.equalTo(100)
        }
        
        contentView.addSubview(productName)
        productName.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
        }
        contentView.addSubview(productPrice)
        productPrice.snp.makeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
