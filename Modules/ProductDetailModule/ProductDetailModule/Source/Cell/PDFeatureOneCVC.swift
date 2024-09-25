//
//  PDFeatureOneCVC.swift
//  ProductDetailModule
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UIKit
import SnapKit
import UICommonKit
final class PDFeatureOneCVC : UICollectionViewCell {
    static let identifier = "pdFeatureOneCVC"
    
    private lazy var featureLabel : UILabel = {
        let label = UILabel()
        label.font = FontTheme.font.primaryFontBoldVersion
        label.textAlignment = .center
        label.textColor = UIColor(hex: ColorTheme.secandaryLabelColor.rawValue)
        return label
    }()
    
    private lazy var multiplyIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "multiply")
        imageView.tintColor = UIColor(hex: ColorTheme.secandaryLabelColor.rawValue)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        contentView.addSubview(featureLabel)
        featureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
        featureLabel.addSubview(multiplyIcon)
        multiplyIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    
    
    
    func setData(text:String){
        featureLabel.text = text
    }
    
    func setUI(backColor:String,borderColor:String,textColor:String,multiplyIconIsHidden:Bool){
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor(hex: borderColor)?.cgColor
        contentView.layer.backgroundColor = UIColor(hex: backColor)?.cgColor
        featureLabel.textColor = UIColor(hex: textColor)
        contentView.layer.borderWidth = 1
        multiplyIcon.isHidden = multiplyIconIsHidden
    }
}
