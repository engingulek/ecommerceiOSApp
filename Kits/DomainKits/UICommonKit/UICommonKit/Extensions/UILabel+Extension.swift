//
//  UILabel+Extension.swift
//  UICommonKit
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UIKit
extension UILabel {
    public static func primaryUILabelLeft(text:String = "") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = FontTheme.font.primaryFontBoldVersion
        label.textColor = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        label.textAlignment = .left
        return label
    }
    
    public static func secondaryLabel(numnerOfLines:Int = .zero) -> UILabel {
        let label = UILabel()
    
        label.font = FontTheme.font.primaryFontNormalVersion
        label.numberOfLines = numnerOfLines
        return label
    }
}
