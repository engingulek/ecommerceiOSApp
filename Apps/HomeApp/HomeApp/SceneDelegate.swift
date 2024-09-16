//
//  SceneDelegate.swift
//  HomeApp
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
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleProtocol.self)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        @Dependency var homeModule : HomeModuleProtocol
        window?.rootViewController = homeModule.createHomeModule()
        window?.makeKeyAndVisible()
    }

  


}

