//
//  CategoryTVC.swift
//  CategoryModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UIKit
import SnapKit
import UICommonKit

final class CategoryTVC : UITableViewCell {
    static let identifier : String = "categoryTVC"
    
    
    private lazy var categoryLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
      
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        contentView.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }
    //TODO: Category model will be added
    func setData(name:String) {
        categoryLabel.text = name
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

