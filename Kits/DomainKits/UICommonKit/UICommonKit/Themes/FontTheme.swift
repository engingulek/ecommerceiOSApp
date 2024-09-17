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
}


extension FontTheme {
    public static var font = FontTheme(primaryFontBoldVersion: .boldSystemFont(ofSize: 20))
}
