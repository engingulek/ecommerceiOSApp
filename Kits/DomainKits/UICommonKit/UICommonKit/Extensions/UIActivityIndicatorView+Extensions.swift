//
//  UIActivityIndicatorView+Extensions.swift
//  UICommonKit
//
//  Created by Engin Gülek on 25.09.2024.
//

import Foundation
import UIKit
extension UIActivityIndicatorView {
    static public func createActivityIndicator() ->  UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .medium
        activityIndicator.color = UIColor(hex: ColorTheme.thirdLabelColor.rawValue)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }
}
