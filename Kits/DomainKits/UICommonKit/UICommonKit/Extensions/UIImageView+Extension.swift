//
//  UIImageView+Extension.swift
//  UICommonKit
//
//  Created by Engin Gülek on 23.09.2024.
//

import Foundation
import UIKit

extension UIImageView {
    public static func primaryImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "iphone")
        return imageView
    }
}
