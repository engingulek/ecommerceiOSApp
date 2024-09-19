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
    
    private lazy var dividerUI : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        return view
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
        
        contentView.addSubview(dividerUI)
        dividerUI.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(3)
        }
    }
    //TODO: Category model will be added
    func setData(name:String) {
        categoryLabel.text = name
    }
    
    func setConfigureUI(color:String){
        categoryLabel.textColor = UIColor(hex: color)
        //TODO: We will look at the best way
        if(color == "#FFA500"){
            dividerUI.backgroundColor = UIColor(hex: color)
        }else{
            dividerUI.backgroundColor = .clear
        }
        
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

