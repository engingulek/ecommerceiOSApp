//
//  DependencyRegister.swift
//  Ecommerce
//
//  Created by Engin Gülek on 16.09.2024.
//

import Foundation
import DependencyKits
import HomeModule

final class DependencyRegister {
    func registerDependencies(){
        let dependencyRegister = DependencyEngine.shared
        dependencyRegister.register(value: HomeRouter(), for: HomeModuleProtocol.self)
     
    }
}
