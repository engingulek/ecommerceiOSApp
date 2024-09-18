//
//  SubCategoryCVC.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UIKit
import SnapKit
import UICommonKit
import Kingfisher

final class SubCategoryCVC : UICollectionViewCell {
    static let identifier : String = "productCVC"
    
    private lazy var subCategoryImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "tshirt.fill")
        return imageView
    }()
    
    
    private lazy var subCategoryName : UILabel = {
        let label = UILabel()
        label.text = "Tshirt"
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI() {
        contentView.addSubview(subCategoryImageView)
        subCategoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    
        contentView.addSubview(subCategoryName)
        subCategoryName.snp.makeConstraints { make in
            make.top.equalTo(subCategoryImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    func setData(subCategory:SubCategories) {
        subCategoryName.text = subCategory.name
        let url = URL(string: subCategory.icon)
        subCategoryImageView.kf.setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
