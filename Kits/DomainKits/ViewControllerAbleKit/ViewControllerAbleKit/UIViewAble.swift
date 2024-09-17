//
//  UIViewAble.swift
//  ViewControllerAbleKit
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import UIKit
import UICommonKit

//MARK: - UIViewAble
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
}
