//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 17.09.2024.
//

import Foundation
import ViewControllerAbleKit
 typealias Ables = UIViewAble

protocol PresenterToViewHomeProtocol:AnyObject,Ables{
    
}


protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
}
