//
//  SceneDelegate.swift
//  ProductListApp
//
//  Created by Engin Gülek on 18.09.2024.
//

import UIKit
import DependencyKits
import ProductListModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: ProductListRouter(), for: ProductListModuleProtocol.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var productListModule : ProductListModuleProtocol
        window?.rootViewController = productListModule.createProductListModule(subCategoryId: 1)
        window?.makeKeyAndVisible()
    }

   

}

