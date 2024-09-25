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

extension UIViewAble where Self : UIViewController  {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
    
}

public protocol UICollectionViewControllerAble {
    func setBackColorCollectionViewController(color:String)
}


extension UICollectionViewControllerAble where Self : UICollectionViewController {
    public func setBackColorCollectionViewController(color:String) {
        collectionView.backgroundColor = UIColor(hex: color)
    }
}


//MARK: - SegueAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}


//MARK: - NavConUIAble
public protocol NavConUIAble {
    func changeTitle(title:String)
}


extension NavConUIAble where Self :  UIViewController{
    
    public func changeTitle(title:String) {
        navigationItem.title = title
    }
    
}


//MARK: AlertMessageAble
public protocol AlertMessageAble {
    func createAlertMesssage(title:String,message:String,actionTitle:String)
   
}

extension AlertMessageAble  where Self : UIViewController {
    public  func createAlertMesssage(title:String,message:String,actionTitle:String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        self.present(alert, animated: true)
        
    }
}
