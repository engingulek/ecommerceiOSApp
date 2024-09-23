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
        label.text = "128GB"
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = 2
        return label
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
    }
    
    func setData(text:String){
        featureLabel.text = text
    }
}
