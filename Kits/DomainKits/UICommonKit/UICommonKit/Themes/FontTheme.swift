//
//  FontTheme.swift
//  UICommonKit
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation

import UIKit
public struct FontTheme {
    public let primaryFontBoldVersion : UIFont
    public let primaryFontNormalVersion : UIFont
    public let secondaryFontBoldVersion : UIFont
    public let secondaryFontNormalVersion : UIFont
}


//TODO: will be edited later
extension FontTheme {
    public static var font = FontTheme(
        primaryFontBoldVersion: .boldSystemFont(ofSize: 20),
        primaryFontNormalVersion : .systemFont(ofSize: 18),
        secondaryFontBoldVersion: .boldSystemFont(ofSize: 25),
        secondaryFontNormalVersion: .systemFont(ofSize: 25)
    )
    
}
