//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import UIKit


public class HomeRouter : HomeModuleProtocol {
    public init(){}
    public func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        return view
    }
    
    
}
