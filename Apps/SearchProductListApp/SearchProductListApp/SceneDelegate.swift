//
//  SceneDelegate.swift
//  SearchProductListApp
//
//  Created by Engin Gülek on 22.09.2024.
//

import UIKit
import DependencyKits
import SearchProductListModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: SearchProductListRouter(), for: SearchProductListModuleProtocol.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var searchProductListModule : SearchProductListModuleProtocol
        window?.rootViewController = searchProductListModule.createSearchProductListModule(text: "")
        window?.makeKeyAndVisible()
    }



}

