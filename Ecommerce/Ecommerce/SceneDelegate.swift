//
//  SceneDelegate.swift
//  Ecommerce
//
//  Created by Engin Gülek on 16.09.2024.
//

import UIKit
import DependencyKits
import HomeModule
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let dependenyRegister = DependencyRegister()
        dependenyRegister.registerDependencies()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var homeModule : HomeModuleProtocol
        window?.rootViewController = UINavigationController(rootViewController: homeModule .createHomeModule())
        window?.makeKeyAndVisible()
    }
    
    
    
}

