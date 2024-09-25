//
//  SceneDelegate.swift
//  ProductDetailApp
//
//  Created by Engin Gülek on 23.09.2024.
//

import UIKit
import DependencyKits
import ProductDetailModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: ProductDetailRouter(), for: ProductDetailModuleProtocol.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var productDetailModule : ProductDetailModuleProtocol
        window?.rootViewController = productDetailModule.createProductListModule(id: 1, product_id: 1)
        window?.makeKeyAndVisible()
    }


}

