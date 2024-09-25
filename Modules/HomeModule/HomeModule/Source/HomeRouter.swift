//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import UIKit
import DependencyKits
import CategoryModule
import SearchProductListModule

//MARK: HomeModuleProtocol
public class HomeRouter : HomeModuleProtocol {
    public init(){}
    public func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter()
        let presenter : ViewToPresenterHomeProtocol = HomePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

//MARK: PresenterToRouterHomeProtocol
extension HomeRouter : PresenterToRouterHomeProtocol {
    
    func toCategoryModule(view: PresenterToViewHomeProtocol?) {
        @Dependency var categoryModuleInterface : CategoryModuleProtocol
        let viewConroller = categoryModuleInterface.createHomeModule()
        view?.pushViewControllerAble(viewConroller, animated: true)
    }
    
    func toSearchProductListModule(view: PresenterToViewHomeProtocol?,text:String) {
        @Dependency var searchProductListModule : SearchProductListModuleProtocol
        let viewConroller = searchProductListModule.createSearchProductListModule(text: text)
        view?.pushViewControllerAble(viewConroller, animated: true)
    }
}
