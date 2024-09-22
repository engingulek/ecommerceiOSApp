//
//  DependencyRegister.swift
//  Ecommerce
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import DependencyKits
import HomeModule
import CategoryModule
import ProductListModule
import SearchProductListModule
final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleProtocol.self)
        dependencyRegister.register(value: CategoryRouter(), for: CategoryModuleProtocol.self)
        dependencyRegister.register(value: ProductListRouter(), for: ProductListModuleProtocol.self)
        dependencyRegister.register(value: SearchProductListRouter(), for: SearchProductListModuleProtocol.self)
     
    }
}
